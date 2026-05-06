{if $step === 'overview'}
    {if isset($seedResult)}
    <div class="alert alert-success">
        <i class="fas fa-check-circle"></i>
        Demo-Daten geladen: <strong>{$seedResult.schuhe}</strong> Schuh-Tabellen und
        <strong>{$seedResult.bindungen}</strong> Bindungs-Tabellen eingefügt
        {if $seedResult.skipped > 0}, <strong>{$seedResult.skipped}</strong> bereits vorhanden (übersprungen){/if}.
    </div>
    {/if}

    {include file='tpl_inc/model_list.tpl'
        items=$models
        includeHeader=false
        create=true
        tabs=false
        select=true
        edit=true
        search=true
        delete=true}
    <style>
    #modelform table tbody td:nth-child(3) { text-transform: capitalize; }
    </style>

    <div class="card mt-4">
        <div class="card-header">
            <div class="subheading1"><i class="fas fa-database"></i> Demo-Daten laden</div>
            <hr class="mb-n3">
        </div>
        <div class="card-body">
            <form method="post" action="{$action}">
                {$jtl_token}
                <div class="form-row align-items-end">
                    <div class="col-sm-4">
                        <label for="seed_wg_schuhe">Warengruppe für Schuhe</label>
                        <select class="custom-select" id="seed_wg_schuhe" name="seed_wg_schuhe" required>
                            <option value="0">— wählen —</option>
                            {foreach from=$warengruppen item=wg}
                            <option value="{$wg->kWarengruppe|intval}">{$wg->cName|escape:'html'}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-sm-4">
                        <label for="seed_wg_bindungen">Warengruppe für Bindungen</label>
                        <select class="custom-select" id="seed_wg_bindungen" name="seed_wg_bindungen" required>
                            <option value="0">— wählen —</option>
                            {foreach from=$warengruppen item=wg}
                            <option value="{$wg->kWarengruppe|intval}">{$wg->cName|escape:'html'}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-sm-auto mt-2 mt-sm-0">
                        <button type="submit" name="seed_demo" value="1" class="btn btn-secondary btn-block">
                            <i class="fas fa-download"></i> Demo-Daten laden
                        </button>
                    </div>
                </div>
                <small class="text-muted d-block mt-2">
                    Lädt 30 vordefinierte Tabellen (11 Schuhmarken, 19 Bindungsmarken).
                    Bereits vorhandene Einträge werden übersprungen.
                    Die Herstellernamen müssen den Herstellern im Shop entsprechen.
                </small>
            </form>
        </div>
    </div>

{elseif $step === 'detail'}
<div id="detail-wrapper">
    <form id="model-detail" name="model_detail" method="post" action="{$action}">
        {$jtl_token}
        <input type="hidden" name="id" value="{$item->getId()|intval}" />
        <input type="hidden" id="inhalt" name="inhalt" value="" />
        <div id="inhalt-data" data-inhalt="{$item->getInhalt()|default:''|escape:'html'}" style="display:none;"></div>

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
                        <select class="custom-select" id="hersteller" name="hersteller" required>
                            <option value="">— Hersteller wählen —</option>
                            {foreach from=$herstellerList item=h}
                            <option value="{$h->cName|escape:'html'}"
                                {if $item->getHersteller() === $h->cName} selected{/if}>
                                {$h->cName|escape:'html'}
                            </option>
                            {/foreach}
                        </select>
                    </div>
                </div>

                <div class="form-group form-row align-items-center">
                    <label class="col col-sm-4 col-form-label text-sm-right" for="kWarengruppe">Warengruppe:</label>
                    <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2">
                        <select class="custom-select" id="kWarengruppe" name="kWarengruppe" required>
                            <option value="0">— Warengruppe wählen —</option>
                            {foreach from=$warengruppen item=wg}
                            <option value="{$wg->kWarengruppe|intval}"
                                {if $item->getKWarengruppe() == $wg->kWarengruppe} selected{/if}>
                                {$wg->cName|escape:'html'}
                            </option>
                            {/foreach}
                        </select>
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

                <hr>

                <div class="form-group form-row align-items-center">
                    <label class="col col-sm-4 col-form-label text-sm-right">Tabellengröße:</label>
                    <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2">
                        <div class="d-flex align-items-center flex-wrap" style="gap: 8px;">
                            <input type="number" id="table-rows" class="form-control"
                                   min="1" max="30" value="4" style="width: 75px;" placeholder="Zeilen">
                            <span class="px-1">Zeilen &times;</span>
                            <input type="number" id="table-cols" class="form-control"
                                   min="1" max="50" value="5" style="width: 75px;" placeholder="Spalten">
                            <span class="px-1">Spalten</span>
                            <button type="button" id="generate-table" class="btn btn-secondary">
                                <i class="fas fa-table"></i> Tabelle erstellen
                            </button>
                        </div>
                        <small class="text-muted mt-1 d-block">Zeile 1 wird automatisch als Kopfzeile verwendet.</small>
                    </div>
                </div>

                <div class="form-group form-row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2">
                        <div id="table-builder-container" class="table-responsive"></div>
                        <p id="table-builder-empty" class="text-muted" style="display:none;">
                            Noch keine Tabelle erstellt. Größe eingeben und „Tabelle erstellen" klicken.
                        </p>
                    </div>
                </div>

            </div>
        </div>

        <div class="card-footer save-wrapper">
            <div class="row first-ml-auto">
                <div class="col-sm-6 col-xl-auto">
                    <button type="submit" name="go-back" value="1"
                            class="btn btn-outline-primary btn-block" formnovalidate>
                        {__('cancelWithIcon')}
                    </button>
                </div>
                <div class="col-sm-6 col-xl-auto">
                    <button type="submit" name="save-model-continue" value="1"
                            class="btn btn-outline-primary btn-block" id="save-and-continue">
                        <i class="fal fa-save"></i> {__('saveAndContinue')}
                    </button>
                </div>
                <div class="col-sm-6 col-xl-auto">
                    <button type="submit" name="save-model" value="1"
                            class="btn btn-primary btn-block">
                        <i class="far fa-save"></i> {__('save')}
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<style>
#table-builder-container table { border-collapse: collapse; }
#table-builder-container thead tr { background-color: #ffa54f; }
#table-builder-container th,
#table-builder-container td { padding: 3px; }
#table-builder-container input.cell-input {
    min-width: 70px;
    width: 100%;
    border: 1px solid #ced4da;
    border-radius: 3px;
    padding: 2px 4px;
    font-size: 0.85rem;
}
</style>

<script>
(function () {
    var inhaltField   = document.getElementById('inhalt');
    var rowsInput     = document.getElementById('table-rows');
    var colsInput     = document.getElementById('table-cols');
    var generateBtn   = document.getElementById('generate-table');
    var container     = document.getElementById('table-builder-container');
    var emptyNotice   = document.getElementById('table-builder-empty');

    function buildTable(numRows, numCols, existing) {
        container.innerHTML = '';

        var table  = document.createElement('table');
        table.className = 'table table-bordered table-sm';

        // Header row
        var thead = table.createTHead();
        var hRow  = thead.insertRow();
        for (var c = 0; c < numCols; c++) {
            var th    = document.createElement('th');
            var input = document.createElement('input');
            input.type = 'text';
            input.className = 'cell-input';
            input.dataset.row = 'h';
            input.dataset.col = c;
            input.value = (existing && existing.headers && existing.headers[c] !== undefined)
                ? existing.headers[c] : '';
            input.placeholder = 'Spalte ' + (c + 1);
            th.appendChild(input);
            hRow.appendChild(th);
        }

        // Data rows (numRows = data rows only, row 0 is header)
        var tbody = table.createTBody();
        for (var r = 0; r < numRows; r++) {
            var tr = tbody.insertRow();
            for (var c = 0; c < numCols; c++) {
                var td    = tr.insertCell();
                var input = document.createElement('input');
                input.type = 'text';
                input.className = 'cell-input';
                input.dataset.row = r;
                input.dataset.col = c;
                input.value = (existing && existing.rows && existing.rows[r] && existing.rows[r][c] !== undefined)
                    ? existing.rows[r][c] : '';
                td.appendChild(input);
            }
        }

        container.appendChild(table);
        emptyNotice.style.display = 'none';
    }

    function serializeTable() {
        var headers = [];
        var rows    = [];

        container.querySelectorAll('[data-row="h"]').forEach(function (inp) {
            headers[parseInt(inp.dataset.col)] = inp.value;
        });

        var maxRow = -1;
        container.querySelectorAll('[data-row]').forEach(function (inp) {
            if (inp.dataset.row !== 'h') {
                maxRow = Math.max(maxRow, parseInt(inp.dataset.row));
            }
        });

        for (var r = 0; r <= maxRow; r++) {
            var row = [];
            container.querySelectorAll('[data-row="' + r + '"]').forEach(function (inp) {
                row[parseInt(inp.dataset.col)] = inp.value;
            });
            rows.push(row);
        }

        return JSON.stringify({ headers: headers, rows: rows });
    }

    // Generate button
    generateBtn.addEventListener('click', function () {
        var rows = Math.max(1, parseInt(rowsInput.value) || 1);
        var cols = Math.max(1, parseInt(colsInput.value) || 1);
        buildTable(rows, cols, null);
    });

    // Serialize on save (not on go-back)
    document.getElementById('model-detail').addEventListener('submit', function () {
        if (container.querySelector('table')) {
            inhaltField.value = serializeTable();
        }
    });

    // Restore existing table on page load
    var raw = document.getElementById('inhalt-data').getAttribute('data-inhalt');
    if (raw) {
        try {
            var data = JSON.parse(raw);
            if (data.headers && data.rows) {
                rowsInput.value = data.rows.length;
                colsInput.value = data.headers.length;
                buildTable(data.rows.length, data.headers.length, data);
            } else {
                emptyNotice.style.display = 'block';
            }
        } catch (e) {
            emptyNotice.style.display = 'block';
        }
    } else {
        emptyNotice.style.display = 'block';
    }
}());
</script>
{/if}
