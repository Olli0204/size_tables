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

        $template = 'newtab.tpl';

        if ($tabName === 'Ein Neuer Tab') {
            $alert = Shop::Container()->getAlertService();
            if (Request::postInt('clear-cache') === 1) {
                if (Form::validateToken()) {
                    $result = $this->getCache()->flushTags($plugin->getCache()->getGroup());
                    if (\is_numeric($result)) {
                        $alert->addAlert(Alert::TYPE_SUCCESS, \__('Cache successfully flushed.'), 'succCacheFlush');
                    } else {
                        $alert->addAlert(Alert::TYPE_ERROR, \__('Could not flush cache!'), 'failedCacheFlush');
                    }
                } else {
                    $alert->addAlert(Alert::TYPE_ERROR, \__('CSRF error!'), 'failedCsrfCheck');
                }
            }
        } elseif ($tabName === 'Synchronisieren') {
            $template = 'tab2.tpl';
        }

        return $smarty->assign('backendURL', $backendURL)
            ->fetch($this->getPlugin()->getPaths()->getAdminPath() . '/templates/' . $template);
    }
}
