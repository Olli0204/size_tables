<?php declare(strict_types=1);

namespace Plugin\size_tables;

use JTL\Helpers\Form;
use JTL\Helpers\Request;
use JTL\Model\DataModelInterface;
use JTL\Pagination\Pagination;
use JTL\Plugin\PluginInterface;
use JTL\Router\Controller\Backend\GenericModelController;
use JTL\Shop;
use JTL\Smarty\JTLSmarty;
use Plugin\size_tables\Models\SizeTable;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class ModelBackendController extends GenericModelController
{
    public int $menuID = 0;

    public PluginInterface $plugin;

    public function updateFromPost(DataModelInterface $model, array $post): bool
    {
        // filterXSS strips all double-quotes, destroying JSON stored in inhalt.
        // Re-inject the raw POST value so the JSON is saved intact.
        if (isset($_POST['inhalt'])) {
            $post['inhalt'] = $_POST['inhalt'];
        }

        return parent::updateFromPost($model, $post);
    }

    public function getResponse(ServerRequestInterface $request, array $args, JTLSmarty $smarty): ResponseInterface
    {
        $this->smarty      = $smarty;
        $this->route       = \str_replace(Shop::getAdminURL(), '', $this->plugin->getPaths()->getBackendURL());
        $this->modelClass  = SizeTable::class;
        $this->adminBaseFile = \ltrim($this->route, '/');

        $smarty->assign('route', $this->route);

        $warengruppen = $this->getDB()->query(
            'SELECT kWarengruppe, cName FROM twarengruppe ORDER BY cName',
            \JTL\DB\ReturnType::ARRAY_OF_OBJECTS
        );
        $hersteller = $this->getDB()->query(
            'SELECT kHersteller, cName FROM thersteller ORDER BY cName',
            \JTL\DB\ReturnType::ARRAY_OF_OBJECTS
        );
        $smarty->assign('warengruppen', $warengruppen)
               ->assign('herstellerList', $hersteller);

        $seeder = new DemoSeeder($this->getDB());

        if (isset($_POST['seed_demo']) && Form::validateToken()) {
            $result = $seeder->insertAll(
                (int)($_POST['seed_wg_schuhe_1']          ?? 0),
                (int)($_POST['seed_wg_schuhe_2']          ?? 0),
                (int)($_POST['seed_wg_bindungen_herren']  ?? 0),
                (int)($_POST['seed_wg_bindungen_damen']   ?? 0)
            );
            $smarty->assign('seedResult', $result);
            return $this->renderOverview($smarty);
        }

        if (isset($_POST['delete_demo']) && Form::validateToken()) {
            $smarty->assign('deleteResult', $seeder->deleteAll());
            return $this->renderOverview($smarty);
        }

        $tab    = Request::getVar('action', 'overview');
        $cSuche = \trim(Request::postVar('cSuche') ?? Request::getVar('cSuche') ?? '');

        if ($tab === 'overview' && $cSuche !== '') {
            return $this->renderSearch($smarty, $cSuche);
        }

        if ($tab === 'overview') {
            $smarty->assign('models', SizeTable::loadAll($this->getDB(), [], []));
        } else {
            $item = SizeTable::loadByAttributes(['id' => Request::getInt('id')], $this->getDB());
            $selectedWg = [];
            foreach (\array_filter(\explode(',', $item->getKWarengruppe() ?? '')) as $id) {
                $selectedWg[(string)(int)$id] = true;
            }
            $smarty->assign('item', $item)
                   ->assign('selectedWarengruppen', $selectedWg)
                   ->assign('defaultTabbertab', $this->menuID);
        }

        $smarty->assign('step', $tab)
               ->assign('tab', $tab)
               ->assign('action', $this->plugin->getPaths()->getBackendURL());

        $response = $this->handle(__DIR__ . '/adminmenu/templates/size_tables.tpl');

        if ($this->step === 'detail') {
            $smarty->assign('defaultTabbertab', $this->menuID);
        }

        return $response;
    }

    private function renderOverview(JTLSmarty $smarty): ResponseInterface
    {
        $smarty->assign('models', SizeTable::loadAll($this->getDB(), [], []))
               ->assign('step', 'overview')
               ->assign('tab', 'overview')
               ->assign('action', $this->plugin->getPaths()->getBackendURL());
        return $this->handle(__DIR__ . '/adminmenu/templates/size_tables.tpl');
    }

    private function renderSearch(JTLSmarty $smarty, string $cSuche): ResponseInterface
    {
        $term    = \mb_strtolower($cSuche);
        $all     = SizeTable::loadAll($this->getDB(), [], []);
        $filtered = $all->filter(static function (SizeTable $item) use ($term): bool {
            return \str_contains(\mb_strtolower($item->getName() ?? ''), $term)
                || \str_contains(\mb_strtolower($item->getHersteller() ?? ''), $term);
        })->values();

        $this->setMessages();

        $tpl        = __DIR__ . '/adminmenu/templates/size_tables.tpl';
        $pagination = (new Pagination(\pathinfo($tpl, \PATHINFO_FILENAME)))
            ->setItemCount($filtered->count())
            ->assemble();

        return $smarty
            ->assign('step', 'overview')
            ->assign('tab', 'overview')
            ->assign('item', new SizeTable($this->getDB()))
            ->assign('models', $filtered->forPage($pagination->getPage() + 1, $pagination->getItemsPerPage()))
            ->assign('action', $this->plugin->getPaths()->getBackendURL())
            ->assign('pagination', $pagination)
            ->assign('searchQuery', $cSuche)
            ->assign('childModel', null)
            ->getResponse($tpl);
    }
}
