{if $step === 'overview'}
    {include file='tpl_inc/model_list.tpl' items=$models includeHeader=false tabs=false select=true edit=true search=true delete=false disable=true enable=true}
{elseif $step === 'detail'}
    {include file='tpl_inc/model_detail.tpl' item=$item includeHeader=false tabs=false saveAndContinue=true save=true cancel=true}
{/if}
