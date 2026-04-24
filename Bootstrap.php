<?php declare(strict_types=1);

namespace Plugin\size_tables;

use JTL\Alert\Alert;
use JTL\Events\Dispatcher;
use JTL\Helpers\Form;
use JTL\Helpers\Request;
use JTL\Link\LinkInterface;
use JTL\Plugin\Bootstrapper;
use JTL\Shop;
use JTL\Smarty\JTLSmarty;
use Laminas\Diactoros\ServerRequestFactory;
use function Functional\first;

class Bootstrap extends Bootstrapper
{
    public function boot(Dispatcher $dispatcher): void
    {
        parent::boot($dispatcher);
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

        $template = 'newtab.tpl';

        if ($tabName === 'Synchronisieren') {
            $template = 'tab2.tpl';
        }

        return $smarty->assign('backendURL', $backendURL)
            ->fetch($plugin->getPaths()->getAdminPath() . '/templates/' . $template);
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
