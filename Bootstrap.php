<?php declare(strict_types=1);

namespace Plugin\size_tables;

use JTL\Events\Dispatcher;
use JTL\Link\LinkInterface;
use JTL\Plugin\Bootstrapper;
use JTL\Shop;
use JTL\Smarty\JTLSmarty;
use Laminas\Diactoros\ServerRequestFactory;
use Plugin\size_tables\Models\SizeTable;
use function Functional\first;

class Bootstrap extends Bootstrapper
{
    public function boot(Dispatcher $dispatcher): void
    {
        parent::boot($dispatcher);
        $dispatcher->listen('shop.hook.' . \HOOK_ARTIKEL_PAGE, [$this, 'onArtikelPage']);
    }

    public function onArtikelPage(array $args): void
    {
        $smarty  = Shop::Smarty();
        $artikel = $smarty->getTemplateVars('Artikel');

        $smarty->assign('showSizeBtnShoes',    false);
        $smarty->assign('showSizeBtnBindings', false);
        $smarty->assign('sizeTablesBoots',     []);
        $smarty->assign('sizeTablesBindungen', []);

        if ($artikel === null || empty($artikel->cHersteller)) {
            return;
        }

        $kWarengruppe = (int)($artikel->kWarengruppe ?? 0);
        if ($kWarengruppe === 0) {
            return;
        }

        $rows     = $this->getDB()->selectAll('size_tables_data', 'hersteller', $artikel->cHersteller);
        $boots    = [];
        $bindings = [];

        foreach ($rows as $row) {
            if ((int)$row->kWarengruppe !== $kWarengruppe) {
                continue;
            }
            $data = \json_decode($row->inhalt ?? '', true);
            if (!\is_array($data) || !isset($data['headers'], $data['rows'])) {
                continue;
            }
            $table = [
                'name'       => $row->name,
                'typ'        => $row->typ,
                'geschlecht' => $row->geschlecht,
                'headers'    => $data['headers'],
                'rows'       => $data['rows'],
            ];
            if ($row->typ === 'boot') {
                $boots[] = $table;
            } elseif ($row->typ === 'bindung') {
                $bindings[] = $table;
            }
        }

        $smarty->assign('showSizeBtnShoes',    !empty($boots));
        $smarty->assign('showSizeBtnBindings', !empty($bindings));
        $smarty->assign('sizeTablesBoots',     $boots);
        $smarty->assign('sizeTablesBindungen', $bindings);
    }

    public function prepareFrontend(LinkInterface $link, JTLSmarty $smarty): bool
    {
        return true;
    }

    public function renderAdminMenuTab(string $tabName, int $menuID, JTLSmarty $smarty): string
    {
        $plugin     = $this->getPlugin();
        $backendURL = \method_exists($plugin->getPaths(), 'getBackendURL')
            ? $plugin->getPaths()->getBackendURL()
            : Shop::getAdminURL() . '/plugin.php?kPlugin=' . $plugin->getID();

        $smarty->assign('menuID', $menuID)
               ->assign('posted', null);

        if ($tabName === 'Größentabellen') {
            return $this->renderModelTab($menuID, $smarty);
        }

        return $smarty->assign('backendURL', $backendURL)
            ->fetch($plugin->getPaths()->getAdminPath() . '/templates/newtab.tpl');
    }

    private function renderModelTab(int $menuID, JTLSmarty $smarty): string
    {
        $controller         = new ModelBackendController(
            $this->getDB(),
            $this->getCache(),
            Shop::Container()->getAlertService(),
            Shop::Container()->getAdminAccount(),
            Shop::Container()->getGetText()
        );
        $controller->menuID = $menuID;
        $controller->plugin = $this->getPlugin();

        $request  = ServerRequestFactory::fromGlobals($_SERVER, $_GET, $_POST, $_COOKIE, $_FILES);
        $response = $controller->getResponse($request, [], $smarty);

        if (\count($response->getHeader('location')) > 0) {
            \header('Location:' . first($response->getHeader('location')));
            exit();
        }

        return (string)$response->getBody();
    }
}
