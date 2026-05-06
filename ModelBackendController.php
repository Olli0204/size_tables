<?php declare(strict_types=1);

namespace Plugin\size_tables;

use JTL\Helpers\Form;
use JTL\Helpers\Request;
use JTL\Model\DataModelInterface;
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

        if (isset($_POST['seed_demo']) && Form::validateToken()) {
            $seeder = new DemoSeeder($this->getDB());
            $result = $seeder->insertAll(
                (int)($_POST['seed_wg_schuhe']   ?? 0),
                (int)($_POST['seed_wg_bindungen'] ?? 0)
            );
            $smarty->assign('seedResult', $result)
                   ->assign('models', SizeTable::loadAll($this->getDB(), [], []));
            $smarty->assign('step', 'overview')->assign('tab', 'overview')
                   ->assign('action', $this->plugin->getPaths()->getBackendURL());
            return $this->handle(__DIR__ . '/adminmenu/templates/size_tables.tpl');
        }

        $tab = Request::getVar('action', 'overview');

        if ($tab === 'overview') {
            $smarty->assign('models', SizeTable::loadAll($this->getDB(), [], []));
        } else {
            $item = SizeTable::loadByAttributes(['id' => Request::getInt('id')], $this->getDB());
            $smarty->assign('item', $item)
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
}
