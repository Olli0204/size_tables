<?php declare(strict_types=1);

namespace Plugin\size_tables;

use JTL\Alert\Alert;
use JTL\Catalog\Category\Kategorie;
use JTL\Catalog\Product\Artikel;
use JTL\Consent\Item;
use JTL\Events\Dispatcher;
use JTL\Events\Event;
use JTL\Helpers\Form;
use JTL\Helpers\Request;
use JTL\Link\LinkInterface;
use JTL\Plugin\Bootstrapper;
use JTL\Router\Router;
use JTL\Shop;
use JTL\Shopsetting;
use JTL\Smarty\JTLSmarty;
use Laminas\Diactoros\ServerRequestFactory;
use function Functional\first;

/**
 * Class Bootstrap
 * @package Plugin\size_tables
 */
class Bootstrap extends Bootstrapper
{
    
    public function boot(Dispatcher $dispatcher)
    {
        
    }
    
    /**
     * @inheritdoc
     */
    public function installed(): void
    {
        
    }

    /**
     * @inheritdoc
     */
    public function updated($oldVersion, $newVersion): void
    {
    }

    /**
     * @inheritdoc
     */
    public function uninstalled(bool $deleteData = true): void
    {
   
    }

    /**
     * @inheritdoc
     */
    public function prepareFrontend(LinkInterface $link, JTLSmarty $smarty): bool
    {
       
    }

    /**
     * @inheritdoc
     */
    public function renderAdminMenuTab(string $tabName, int $menuID, JTLSmarty $smarty): string
    {
        $plugin     = $this->getPlugin();
        $backendURL = \method_exists($plugin->getPaths(), 'getBackendURL')
            ? $plugin->getPaths()->getBackendURL()
            : Shop::getAdminURL() . '/plugin.php?kPlugin=' . $plugin->getID();

        $smarty->assign('menuID', $menuID)
        ->assign('posted', null);

        $template = 'newtab.tpl';

        // if ($tabName === 'Models') {
        //     $controller         = new ModelBackendController(
        //         $this->getDB(),
        //         $this->getCache(),
        //         Shop::Container()->getAlertService(),
        //         Shop::Container()->getAdminAccount(),
        //         Shop::Container()->getGetText()
        //     );
        //     $controller->menuID = $menuID;
        //     $controller->plugin = $plugin;
        //     $request            = ServerRequestFactory::fromGlobals($_SERVER, $_GET, $_POST, $_COOKIE, $_FILES);
        //     $response           = $controller->getResponse($request, [], $smarty);
        //     if (count($response->getHeader('location')) > 0) {
        //         \header('location:' . first($response->getHeader('location')));
        //         exit();
        //     }
        //     return (string)$response->getBody();
        // }

        if ($tabName === 'Ein Neuer Tab') {
            $alert = Shop::Container()->getAlertService();
            if (Request::postInt('clear-cache') === 1) {
                if (Form::validateToken()) {
                    // we used the plugin's ID as an additional cache tag, so we can flush the whole group
                    $result = $this->getCache()->flushTags($plugin->getCache()->getGroup());
                    // flushGroup() returns the number of deleted entries or FALSE if an error occured
                    if (\is_numeric($result)) {
                        $alert->addAlert(Alert::TYPE_SUCCESS, \__('Cache successfully flushed.'), 'succCacheFlush');
                    } else {
                        $alert->addAlert(Alert::TYPE_ERROR, \__('Could not flush cache!'), 'failedCacheFlush');
                    }
                } else {
                    $alert->addAlert(Alert::TYPE_ERROR, \__('CSRF error!'), 'failedCsrfCheck');
                }
            }
        }
        elseif ($tabName === 'Synchronisieren') {
            $template = 'tab2.tpl';

    }


    return $smarty->assign('backendURL', $backendURL)
            ->fetch($this->getPlugin()->getPaths()->getAdminPath() . '/templates/' . $template);

}
}
