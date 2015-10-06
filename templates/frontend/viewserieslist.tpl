
<div class="header">
    <h2>TV Series &gt; <strong>List</strong></h2>
</div>

<form action="" method="get">
    <div class="btn-group">
        <a class="btn btn-default" href="{$smarty.const.WWW_TOP}/myshows" title="List my watched shows">My shows</a>
        <a class="btn btn-default" href="{$smarty.const.WWW_TOP}/myshows/browse" title="browse your shows">Find all my shows</a>
        <div class="input-group">
            <input class="form-control" type="text" name="title" value="{$ragename}" placeholder="Search here"/>
            <span class="input-group-btn">
                <button type="submit" class="btn btn-default">GO</button>
            </span>
        </div>
    </div>
</form>

<div class="btn-toolbar" role="toolbar">
    <div class="btn-group btn-group-sm" role="group" aria-label="...">
        <a class="btn {if $seriesletter == '0-9'}btn-success{else}btn-default{/if}" href="{$smarty.const.WWW_TOP}/series/0-9">0-9</a>
        {foreach $seriesrange as $range}
        <a class="btn {if $range == $seriesletter}btn-success{else}btn-default{/if}" href="{$smarty.const.WWW_TOP}/series/{$range}">{$range}</a>
        {/foreach}
    </div>
</div>

{$site->adbrowse}
{if $serieslist|@count > 0}
    <table class="data table table-condensed table-striped table-responsive table-hover icons" id="browsetable">
        {foreach $serieslist as $sletter => $series}
            <tr>
                <th width="35%">Name</th>
                <th>Country</th>
                <th width="35%">Genre</th>
                <th class="mid">Option</th>
                <th class="mid">View</th>
            </tr>
            {foreach $series as $s}
                <tr>
                    <td><a class="title" title="View series" href="{$smarty.const.WWW_TOP}/series/{$s.rageid}">{$s.releasetitle|escape:"htmlall"}</a>{if $s.prevdate != ''}<br /><span class="label label-info">Last: {$s.previnfo|escape:"htmlall"} aired {$s.prevdate|date_format}</span>{/if}</td>
                    <td>{$s.country|escape:"htmlall"}</td>
                    <td>{$s.genre|escape:"htmlall"|replace:'|':', '}</td>
                    <td class="mid">
                        {if $s.userseriesid != ''}
                            <a href="{$smarty.const.WWW_TOP}/myshows/edit/{$s.rageid}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows btn btn-xs btn-warning" rel="edit" name="series{$s.rageid}" title="Edit">Edit</a>
                            <br />
                            <a href="{$smarty.const.WWW_TOP}/myshows/delete/{$s.rageid}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows btn btn-xs btn-danger" rel="remove" name="series{$s.rageid}" title="Remove from My Shows">Remove</a>
                        {else}
                            <a href="{$smarty.const.WWW_TOP}/myshows/add/{$s.rageid}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows btn btn-xs btn-primary" rel="add" name="series{$s.rageid}" title="Add to My Shows">Add</a>
                        {/if}
                    </td>
                    <td class="mid">
                        <a title="View series" href="{$smarty.const.WWW_TOP}/series/{$s.rageid}">Series</a>
                        {if $s.rageid > 0}
                            <a title="View at TVRage" target="_blank" href="{$site->dereferrer_link}http://www.tvrage.com/shows/id-{$s.rageid}">TVRage</a>&nbsp;&nbsp;
                            <a title="RSS Feed for {$s.releasetitle|escape:"htmlall"}" href="{$smarty.const.WWW_TOP}/rss?rage={$s.rageid}&amp;dl=1&amp;i={$userdata.id}&amp;r={$userdata.rsstoken}"><i class="fa fa-rss"></i></a>
                        {/if}
                    </td>
                </tr>
            {/foreach}
        {/foreach}
    </table>
{else}
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Hmm!</strong> No result on that search term.
    </div>
{/if}
