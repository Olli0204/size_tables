<form class="someform" method="post" action="{$backendURL}">
    {$jtl_token}
    <input type="hidden" name="kPluginAdminMenu" value="{$menuID}">
    <button name="clear-cache" value="1" class="btn btn-danger" type="submit">
        <i class="fa fa-trash"></i> {__('Clear plugin cache')}
    </button>
</form>
