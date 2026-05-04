{block name='productdetails-details-info-description-wrapper' append}
    <style>
    .gclassolli {
        background-color: white;
        border: 1px solid black;
        padding: 3px 20px 3px 20px;
        font-family: 'Open Sans', sans-serif;
    }

    .gclassolli:hover {
        background-color: #FFA54F;
    }

    .modalpopup {
      display: none;
      position: fixed;
      z-index: 600 !important;
      padding-top: 150px;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0,0,0);
      background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
      background-color: #fefefe;
      margin: auto;
      padding: 15px;
      border: 2px solid #FFA54F;
      width: 70%;
    }

    .close-btn {
      color: #aaaaaa;
      font-size: 28px;
      font-weight: bold;
      margin-right: 15px;
    }

    .close-btn:hover,
    .close-btn:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
    }

    .popup-content {
      display: block;
      margin:0 auto;
      justify-content: center;
    }

    .modal-header {
      margin:0 auto;
      text-decoration: underline;
      justify-content: center;
      border-bottom: 0px solid white;
      padding-bottom: 25px;
    }

    .close-the-modal {
      display: flex;
      justify-content: flex-end;
    }

    .size-table-style td{
      padding: 5px;
      text-align: center;
    }

    .size-table-style-binding td{
      padding: 15px;
      text-align: center;
      padding-left: 40px;
      padding-right: 40px;
    }

    .size-table-style-binding tr:nth-child(even){
      background-color: #f2f2f2;
    }

    .size-table-first-row{
      background-color: #ffa44fb5;
    }
    .size-table-first-row th{
      padding: 4px;
      text-align: center;
    }

    .size-table-first-row-binding{
      background-color: #ffa44fb5;
    }
    .size-table-first-row-binding th{
      padding: 15px;
      text-align: center;
    }

    .testcontainer {
      display: flex;
      justify-content: center;
      margin-bottom: 15px;
    }
    </style>

{assign var='mobile' value=false}

{if $oPlugin_size_tables->getConfig()->getValue('size_tables_mobile_active') !== 'Y' && $isMobile}
      {assign var='mobile' value=true}
{/if}

{if $oPlugin_size_tables->getConfig()->getValue('size_tables_active') === 'Y' && $mobile === false && $showSizeBtnShoes}

    <button type="button" id="sizeBtnShoes" class="gclassolli" {if $oPlugin_size_tables->getConfig()->getValue('size_tables_name_active') === 'Y'}style="display: inline-flex; justify-content: center; align-items: center;"{/if}><i class="fas fa-ruler-horizontal fa-lg"></i>
    {if $oPlugin_size_tables->getConfig()->getValue('size_tables_name_active') === 'Y'}
      <span style='font-family: "Open Sans", sans-serif; font-size: 0.875rem; padding-bottom: auto; padding-top: auto; margin-left: 5px;'>
        {$oPlugin_size_tables->getLocalization()->getTranslation('size_heading')}
      </span>
    {/if}
    </button>
    <div id='sizeModalShoes' class='modalpopup'>
        <div class='modal-content'>
            <div class="close-the-modal">
                <span class="close-btn">&times;</span>
            </div>
            <div class="popup-content">
                <h2 class="modal-header">{$oPlugin_size_tables->getLocalization()->getTranslation('size_heading')} {$Artikel->cHersteller}</h2>
                <div class="testcontainer">
                {foreach from=$sizeTablesBoots item=sizeTable}
                <table class="size-table-style">
                    <thead><tr class="size-table-first-row">
                        {foreach from=$sizeTable.headers item=h}<th>{$h|escape:'html'}</th>{/foreach}
                    </tr></thead>
                    <tbody>
                        {foreach from=$sizeTable.rows item=row}
                        <tr>{foreach from=$row item=cell}<td>{$cell|escape:'html'}</td>{/foreach}</tr>
                        {/foreach}
                    </tbody>
                </table>
                {/foreach}
                </div>
            </div>
        </div>
    </div>


    <script>
    var sizeModalShoes = document.getElementById('sizeModalShoes');
    var sizeBtnShoes = document.getElementById('sizeBtnShoes');
    var sizeCloseShoes = sizeModalShoes.querySelector('.close-btn');
    sizeBtnShoes.addEventListener('click', function() { sizeModalShoes.style.display = 'block'; });
    sizeCloseShoes.addEventListener('click', function() { sizeModalShoes.style.display = 'none'; });
    window.addEventListener('click', function(event) {
        if (event.target === sizeModalShoes) { sizeModalShoes.style.display = 'none'; }
    });
    </script>

{/if}


{if $oPlugin_size_tables->getConfig()->getValue('size_tables_active') === 'Y' && $mobile === false && $showSizeBtnBindings}

  <button type="button" id="sizeBtnBindings" class="gclassolli" {if $oPlugin_size_tables->getConfig()->getValue('size_tables_name_active') === 'Y'}style="display: inline-flex; justify-content: center; align-items: center;"{/if}><i class="fas fa-ruler-horizontal fa-lg"></i>
  {if $oPlugin_size_tables->getConfig()->getValue('size_tables_name_active') === 'Y'}
    <span style='font-family: "Open Sans", sans-serif; font-size: 0.875rem; padding-bottom: auto; padding-top: auto; margin-left: 5px;'>
      {$oPlugin_size_tables->getLocalization()->getTranslation('size_heading')}
    </span>
  {/if}
  </button>
  <div id='sizeModalBindings' class='modalpopup'>
      <div class='modal-content'>
          <div class="close-the-modal">
              <span class="close-btn">&times;</span>
          </div>
          <div class="popup-content">
              <h2 class="modal-header">{$oPlugin_size_tables->getLocalization()->getTranslation('size_heading')} {$Artikel->cHersteller}</h2>
              <div class="testcontainer">

              {foreach from=$sizeTablesBindungen item=sizeTable}
              <table class="size-table-style-binding">
                  <thead><tr class="size-table-first-row-binding">
                      {foreach from=$sizeTable.headers item=h}<th>{$h|escape:'html'}</th>{/foreach}
                  </tr></thead>
                  <tbody>
                      {foreach from=$sizeTable.rows item=row}
                      <tr>{foreach from=$row item=cell}<td>{$cell|escape:'html'}</td>{/foreach}</tr>
                      {/foreach}
                  </tbody>
              </table>
              {/foreach}

              </div>
              <br>
              <h3 style="color: red;">{$oPlugin_size_tables->getLocalization()->getTranslation('warning_bindings')}</h3>
          </div>
      </div>
  </div>


  <script>
    var sizeModalBindings = document.getElementById('sizeModalBindings');
    var sizeBtnBindings = document.getElementById('sizeBtnBindings');
    var sizeCloseBindings = sizeModalBindings.querySelector('.close-btn');
    sizeBtnBindings.addEventListener('click', function() { sizeModalBindings.style.display = 'block'; });
    sizeCloseBindings.addEventListener('click', function() { sizeModalBindings.style.display = 'none'; });
    window.addEventListener('click', function(event) {
        if (event.target === sizeModalBindings) { sizeModalBindings.style.display = 'none'; }
    });
  </script>

{/if}



{/block}
