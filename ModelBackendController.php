<?php declare(strict_types=1);

namespace Plugin\size_tables;

use JTL\Helpers\Request;
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

    public function getResponse(ServerRequestInterface $request, array $args, JTLSmarty $smarty): ResponseInterface
    {
        $this->smarty      = $smarty;
        $this->route       = \str_replace(Shop::getAdminURL(), '', $this->plugin->getPaths()->getBackendURL());
        $this->modelClass  = SizeTable::class;
        $this->adminBaseFile = \ltrim($this->route, '/');

        $smarty->assign('route', $this->route);

        $tab = Request::getVar('action', 'overview');

        if ($tab === 'overview') {
            $smarty->assign('models', SizeTable::loadAll($this->getDB(), [], []));
        } else {
            $item = SizeTable::loadByAttributes(['id' => Request::getInt('id')], $this->getDB());
            $inhalt        = $item->getInhalt() ?: '';
            $inhaltDecoded = $inhalt ? \json_decode($inhalt, true) : null;
            $smarty->assign('item', $item)
                   ->assign('itemInhalt', $inhaltDecoded)
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
