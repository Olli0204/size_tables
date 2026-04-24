<form method="post" class="form-inline">
    {$jtl_token}
    <div class="form-group">
        <div class="form-group mr-2">
            <input type="hidden" name="kPluginAdminMenu" value="{$menuID}">
            <input type="text" name="tab2_input" value="{$posted|default:''}" class="form-control" size="22">
        </div>
        <button class="btn btn-primary" type="submit">{__('submit')}</button>
    </div>
</form>
