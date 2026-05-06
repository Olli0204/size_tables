<style>
.size-guide-table thead th {
    background-color: #ffa44fb5;
    padding: 5px 8px;
    text-align: center;
    white-space: nowrap;
}
.size-guide-table td {
    padding: 4px 8px;
    text-align: center;
    white-space: nowrap;
}
.size-guide-table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}
.size-guide-table tbody tr:first-child td {
    font-weight: 600;
}
.size-guide-gender-badge {
    display: inline-block;
    font-size: 0.75rem;
    font-weight: 600;
    padding: 2px 8px;
    border-radius: 3px;
    margin-bottom: 8px;
    text-transform: uppercase;
    letter-spacing: 0.05em;
}
.badge-herren  { background: #d0e8ff; color: #1a5a99; }
.badge-damen   { background: #ffd6e8; color: #99195a; }
.badge-unisex  { background: #e8e8e8; color: #555; }
.size-guide-warning {
    color: #c00;
    font-size: 0.85rem;
    margin-top: 12px;
}
</style>

<h1 class="page-heading mb-2">Gr&ouml;&szlig;entabellen</h1>
<p class="text-muted mb-4">Alle Gr&ouml;&szlig;entabellen f&uuml;r Snowboard-Schuhe und Bindungen auf einen Blick.</p>

{if !empty($pageBoots)}
<h2 class="h4 mt-4 mb-3"><i class="fas fa-shoe-prints"></i> Schuhgr&ouml;&szlig;en</h2>
<div class="accordion" id="accordion-boots">
    {foreach $pageBoots as $hersteller => $tables}
    {assign var='bid' value="boot-`$hersteller@iteration`"}
    <div class="card">
        <div class="card-header py-2" id="h-{$bid}">
            <button class="btn btn-link font-weight-bold text-dark" type="button"
                    data-toggle="collapse" data-target="#{$bid}"
                    aria-expanded="{if $hersteller@first}true{else}false{/if}"
                    aria-controls="{$bid}">
                {$hersteller|escape:'html'}
            </button>
        </div>
        <div id="{$bid}" class="collapse{if $hersteller@first} show{/if}" data-parent="#accordion-boots">
            <div class="card-body">
                <div class="table-responsive">
                    {foreach $tables as $table}
                    <table class="table table-bordered table-sm size-guide-table mb-3">
                        <thead>
                            <tr>
                                {foreach $table.headers as $h}
                                <th>{$h|escape:'html'}</th>
                                {/foreach}
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $table.rows as $row}
                            <tr>
                                {foreach $row as $cell}
                                <td>{$cell|escape:'html'}</td>
                                {/foreach}
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
    {/foreach}
</div>
{/if}

{if !empty($pageBindings)}
<h2 class="h4 mt-5 mb-3"><i class="fas fa-link"></i> Bindungsgr&ouml;&szlig;en</h2>
<p class="text-muted small mb-3">
    <i class="fas fa-exclamation-triangle text-danger"></i>
    Herstellerangabe &ndash; Werte stimmen nur bei Boots des gleichen Herstellers.
</p>
<div class="accordion" id="accordion-bindings">
    {foreach $pageBindings as $hersteller => $tables}
    {assign var='did' value="bind-`$hersteller@iteration`"}
    <div class="card">
        <div class="card-header py-2" id="h-{$did}">
            <button class="btn btn-link font-weight-bold text-dark" type="button"
                    data-toggle="collapse" data-target="#{$did}"
                    aria-expanded="{if $hersteller@first}true{else}false{/if}"
                    aria-controls="{$did}">
                {$hersteller|escape:'html'}
            </button>
        </div>
        <div id="{$did}" class="collapse{if $hersteller@first} show{/if}" data-parent="#accordion-bindings">
            <div class="card-body">
                {foreach $tables as $table}
                {if $table.geschlecht === 'herren'}
                    <span class="size-guide-gender-badge badge-herren">Herren</span>
                {elseif $table.geschlecht === 'damen'}
                    <span class="size-guide-gender-badge badge-damen">Damen</span>
                {elseif $table.geschlecht === 'kinder'}
                    <span class="size-guide-gender-badge badge-unisex">Kinder</span>
                {/if}
                <div class="table-responsive mb-4">
                    <table class="table table-bordered table-sm size-guide-table">
                        <thead>
                            <tr>
                                {foreach $table.headers as $h}
                                <th>{$h|escape:'html'}</th>
                                {/foreach}
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $table.rows as $row}
                            <tr>
                                {foreach $row as $cell}
                                <td>{$cell|escape:'html'}</td>
                                {/foreach}
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                {/foreach}
            </div>
        </div>
    </div>
    {/foreach}
</div>
{/if}

{if empty($pageBoots) && empty($pageBindings)}
<div class="alert alert-info">
    <i class="fal fa-info-circle"></i> Es sind noch keine Gr&ouml;&szlig;entabellen vorhanden.
</div>
{/if}
