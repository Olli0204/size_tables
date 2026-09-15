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
        $config  = $this->getPlugin()->getConfig();

        // Checkbox-Einstellungen: JTL speichert 'on' (angehakt) bzw. '' (abgewaehlt); 'Y' stammt aus den Selectboxen bis 1.3.5
        $smarty->assign('sizeTablesActive',       $this->isOn($config->getValue('size_tables_active')));
        $smarty->assign('sizeTablesMobileActive', $this->isOn($config->getValue('size_tables_mobile_active')));
        $smarty->assign('sizeTablesNameActive',   $this->isOn($config->getValue('size_tables_name_active')));

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
            $assigned = \array_filter(\array_map('intval', \explode(',', $row->kWarengruppe ?? '')));
            if (!\in_array($kWarengruppe, $assigned, true)) {
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

    private function isOn(mixed $value): bool
    {
        return \in_array((string)$value, ['on', 'Y'], true);
    }

    public function prepareFrontend(LinkInterface $link, JTLSmarty $smarty): bool
    {
        $rows = $this->getDB()->query(
            'SELECT * FROM size_tables_data ORDER BY typ, hersteller, geschlecht',
            \JTL\DB\ReturnType::ARRAY_OF_OBJECTS
        );

        $boots    = [];
        $bindings = [];

        foreach ($rows as $row) {
            $data = \json_decode($row->inhalt ?? '', true);
            if (!\is_array($data) || !isset($data['headers'], $data['rows'])) {
                continue;
            }
            $table = [
                'name'       => $row->name,
                'geschlecht' => $row->geschlecht,
                'headers'    => $data['headers'],
                'rows'       => $data['rows'],
            ];
            if ($row->typ === 'boot') {
                $boots[$row->hersteller][] = $table;
            } else {
                $bindings[$row->hersteller][] = $table;
            }
        }

        $smarty->assign('pageBoots',    $boots);
        $smarty->assign('pageBindings', $bindings);

        return false;
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
