{if $step === 'overview'}
    {include file='tpl_inc/model_list.tpl'
        items=$models
        includeHeader=false
        create=true
        tabs=false
        select=true
        edit=true
        search=true
        delete=true}

{elseif $step === 'detail'}
<div id="detail-wrapper">
    <form id="model-detail" name="model_detail" method="post" action="{$action}">
        {$jtl_token}
        <input type="hidden" name="id" value="{$item->getId()|intval}" />
        <div class="card">
            <div class="card-header">
                <div class="subheading1">Größentabelle</div>
                <hr class="mb-n3">
            </div>
            <div class="card-body">

                <div class="form-group form-row align-items-center">
                    <label class="col col-sm-4 col-form-label text-sm-right" for="name">Name:</label>
                    <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2">
                        <input type="text" class="form-control" id="name" name="name"
                               value="{$item->getName()|default:''}" required>
                    </div>
                </div>

                <div class="form-group form-row align-items-center">
                    <label class="col col-sm-4 col-form-label text-sm-right" for="hersteller">Hersteller:</label>
                    <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2">
                        <input type="text" class="form-control" id="hersteller" name="hersteller"
                               value="{$item->getHersteller()|default:''}" required>
                    </div>
                </div>

                <div class="form-group form-row align-items-center">
                    <label class="col col-sm-4 col-form-label text-sm-right" for="typ">Typ:</label>
                    <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2">
                        <select class="custom-select" id="typ" name="typ" required>
                            <option value="bindung"{if $item->getTyp() === 'bindung'} selected{/if}>Bindung</option>
                            <option value="boot"{if $item->getTyp() === 'boot'} selected{/if}>Boot</option>
                        </select>
                    </div>
                </div>

                <div class="form-group form-row align-items-center">
                    <label class="col col-sm-4 col-form-label text-sm-right" for="geschlecht">Geschlecht:</label>
                    <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2">
                        <select class="custom-select" id="geschlecht" name="geschlecht" required>
                            <option value="herren"{if $item->getGeschlecht() === 'herren'} selected{/if}>Herren</option>
                            <option value="damen"{if $item->getGeschlecht() === 'damen'} selected{/if}>Damen</option>
                            <option value="kinder"{if $item->getGeschlecht() === 'kinder'} selected{/if}>Kinder</option>
                        </select>
                    </div>
                </div>

                <div class="form-group form-row align-items-center">
                    <label class="col col-sm-4 col-form-label text-sm-right" for="inhalt">Inhalt:</label>
                    <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2">
                        <textarea class="form-control" id="inhalt" name="inhalt"
                                  rows="12" required>{$item->getInhalt()|default:''}</textarea>
                    </div>
                </div>

            </div>
        </div>
        <div class="card-footer save-wrapper">
            <div class="row first-ml-auto">
                <div class="col-sm-6 col-xl-auto">
                    <button type="submit" name="go-back" value="1" class="btn btn-outline-primary btn-block">
                        {__('cancelWithIcon')}
                    </button>
                </div>
                <div class="col-sm-6 col-xl-auto">
                    <button type="submit" name="save-model-continue" value="1" class="btn btn-outline-primary btn-block">
                        <i class="fal fa-save"></i> {__('saveAndContinue')}
                    </button>
                </div>
                <div class="col-sm-6 col-xl-auto">
                    <button type="submit" name="save-model" value="1" class="btn btn-primary btn-block">
                        <i class="far fa-save"></i> {__('save')}
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
{/if}
