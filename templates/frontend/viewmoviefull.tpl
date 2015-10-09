{assign var="catsplit" value=">"|explode:$catname}
{if $results|@count > 0}
		{foreach from=$results item=result}
			<div class="header">
				<div class="breadcrumb-wrapper">
					<ol class="breadcrumb">
						<li><a href="{$smarty.const.WWW_TOP}/Movies">Movies</a></li>
						/ {$result.title|escape:"htmlall"} ({$result.year})
					</ol>
				</div>
			</div>
			<div class="box-body">
			<div id="moviefull" style="min-height:100%;">
					{if $result.cover == 1}
					<img class="pull-left" style="margin-right:50px; max-height:300px;"
						 alt="{$result.title|escape:"htmlall"} Logo"
						 src="{$smarty.const.WWW_TOP}/covers/movies/{$result.imdbid}-cover.jpg"></img>
					{if $result.trailer != ''}<div class="pull-right">{$result.trailer}&nbsp;&nbsp;&nbsp;</div>{/if}
					{else}
						<img class="pull-right" style="margin-right:50px; max-height:300px;"
							 alt="{$result.title|escape:"htmlall"} Logo"
							 src="{$smarty.const.WWW_TOP}themes_shared/images/nomoviecover.jpg"/>
					{/if}
					<span class="h1" style="display:inline;">{$result.title|escape:"htmlall"} ({$result.year})
							&nbsp;<a
								class="btn btn-sm btn-warning" target="_blank"
								href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$result.imdbid}/"
								name="imdb{$result.imdbid}" title="View IMDB page for this movie">IMDB
							</a>
							<a target="_blank"
							   href="{$site->dereferrer_link}http://trakt.tv/search/imdb/tt{$result.imdbid}/"
							   name="trakt{$result.imdbid}" title="View Trakt page for this movie"
							   class="btn btn-sm btn-danger" rel="trakt">TRAKT</a>
					</span>
					<h4>{if $result.genre != ''}{$result.genre|replace:"|":" / "}{/if}</h4>
					{if $result.tagline != ''}
						<p class="lead" style="margin-right:300px;">"{$result.tagline|escape:"htmlall"}"</p>
					{/if}
					<dl style="margin-right:300px;">
						{if $result.plot != ''}
							<dt>Plot</dt>
							<dd>{$result.plot|escape:"htmlall"}</dd>
						{/if}
						{if $result.rating != ''}
							<dt>Rating</dt>
							<dd>{$result.rating}
							/10 {if $result.ratingcount != ''}({$result.ratingcount|number_format} votes)</dd>{/if}
						{/if}
						{if $result.director != ''}
							<dt>Director</dt>
							<dd>{$result.director|replace:"|":", "}</dd>
						{/if}
						{if $result.actors != ''}
							<dt>Actors</dt>
							<dd>{$result.actors|replace:"|":", "}</dd>
						{/if}
					</dl>
			</div>
			<form id="nzb_multi_operations_form" action="get">
				<div class="well well-small">
					<div class="nzb_multi_operations">
						With Selected:
						{if $section != ''}View:
							<a href="{$smarty.const.WWW_TOP}/{$section}?t={$category}">Covers</a>
							|
							<b>List</b>
							<br/>
						{/if}
						<div class="btn-group">
							<input type="button" class="nntmux_multi_operations_download btn btn-sm btn-success"
								   value="Download NZBs"/>
							<input type="button" class="nntmux_multi_operations_cart btn btn-sm btn-info"
								   value="Add to Cart"/>
							{if isset($sabintegrated)}
								<input type="button" class="nzb_multi_operations_sab btn btn-sm btn-primary"
									   value="Send to Queue"/>
							{/if}
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							{if isset($isadmin)}
								<div class="pull-right">
									Admin:
									<div class="btn-group btn-group-sm">
										<input type="button" class="nntmux_multi_operations_edit btn btn-sm btn-warning"
											   value="Edit"/>
										<input type="button" class="nntmux_multi_operations_delete btn btn-sm btn-danger"
											   value="Delete"/>
									</div>
								</div>
							{/if}
						</div>
						<div class="btn-group pull-right">
							<input class="form-control input-sm" type="text" placeholder="Filter.." id="filter-text" type="text">
						</div>
						<div class="btn-group pull-right" data-toggle="buttons-radio" id="filter-quality">
							<button class="btn btn-sm btn-primary" data-quality="">Any</button>
							<button class="btn btn-sm btn-primary" data-quality="720p">720p</button>
							<button class="btn btn-sm btn-primary" data-quality="1080p">1080p</button>
							<button class="btn btn-sm btn-primary" data-quality="complete bluray">BDISK</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xlg-12 portlets">
						<div class="panel panel-default">
							<div class="panel-body pagination2">
								<table style="width:100%;"
									   class="data table table-condensed table-striped table-responsive table-hover">
									<tr  class="dont-filter"">
										<th>
											<input id="chkSelectAll" type="checkbox" class="nntmux_check_all"/>
											<label for="chkSelectAll" style="display:none;">Select All</label>
										</th>
										<th>Name<br/>
											<a title="Sort Descending" href="{$orderbyname_desc}">
												<i class="fa fa-icon-caret-down"></i>
											</a>
											<a title="Sort Ascending" href="{$orderbyname_asc}">
												<i class="fa fa-icon-caret-up"></i>
											</a>
										</th>
										<th>Category<br/>
											<a title="Sort Descending" href="{$orderbycat_desc}">
												<i class="fa fa-icon-caret-down"></i>
											</a>
											<a title="Sort Ascending" href="{$orderbycat_asc}">
												<i class="fa fa-icon-caret-up"></i>
											</a>
										</th>
										<th>Posted<br/>
											<a title="Sort Descending" href="{$orderbyposted_desc}">
												<i class="fa fa-icon-caret-down"></i>
											</a>
											<a title="Sort Ascending" href="{$orderbyposted_asc}">
												<i class="fa fa-icon-caret-up"></i>
											</a>
										</th>
										<th>Size<br/>
											<a title="Sort Descending" href="{$orderbysize_desc}">
												<i class="fa fa-icon-caret-down"></i>
											</a>
											<a title="Sort Ascending" href="{$orderbysize_asc}">
												<i class="fa fa-icon-caret-up"></i>
											</a>
										</th>
										<th>Action</th>
									</tr>
									{assign var="msplits" value=","|explode:$result.grp_release_id}
									{assign var="mguid" value=","|explode:$result.grp_release_guid}
									{assign var="mnfo" value=","|explode:$result.grp_release_nfoid}
									{assign var="mgrp" value=","|explode:$result.grp_release_grpname}
									{assign var="mname" value="#"|explode:$result.grp_release_name}
									{assign var="mpostdate" value=","|explode:$result.grp_release_postdate}
									{assign var="msize" value=","|explode:$result.grp_release_size}
									{assign var="mtotalparts" value=","|explode:$result.grp_release_totalparts}
									{assign var="mcomments" value=","|explode:$result.grp_release_comments}
									{assign var="mgrabs" value=","|explode:$result.grp_release_grabs}
									{assign var="mpass" value=","|explode:$result.grp_release_password}
									{assign var="minnerfiles" value=","|explode:$result.grp_rarinnerfilecount}
									{assign var="mhaspreview" value=","|explode:$result.grp_haspreview}
									{assign var="mcat" value=","|explode:$result.grp_release_categoryid}
									{assign var="mcatname" value=","|explode:$result.grp_release_categoryname}
									
									{foreach from=$msplits item=m}
										<tr class="{cycle values=",alt"} filter" data-name="{$mname[$m@index]|escape:"htmlall"|replace:".":" "|lower}" id="guid{$mguid[$m@index]}">
											<td class="check"><input id="chk{$mguid[$m@index]|substr:0:7}"
																	 type="checkbox"
																	 class="nzb_check"
																	 value="{$mguid[$m@index]}"/></td>
											<td class="item">
												<a title="View details"
												   href="{$smarty.const.WWW_TOP}/details/{$mguid[$m@index]}/{$mname[$m@index]|escape:"htmlall"}">{$mname[$m@index]|escape:"htmlall"|replace:".":" "}</a>
												<br/>
						<span class="label label-default">{$mgrabs[$m@index]}
							grab{if $mgrabs[$m@index] != 1}s{/if}</span>
												{if $mnfo[$m@index] > 0}<span class="label label-default"><a
															href="{$smarty.const.WWW_TOP}/nfo/{$mguid[$m@index]}"
															class="text-muted">NFO</a>
													</span>{/if}
												{if $mpass[$m@index] == 2}
													<i class="fa fa-icon-lock"></i>
												{elseif $mpass[$m@index] == 1}
													<i class="fa fa-icon-lock"></i>
												{/if}
											</td>
											<td class="less"><span
														class="label label-default">{$mcatname[$m@index]}</span>
											</td>
											<td class="less mid"
												title="{$mpostdate[$m@index]}">{$mpostdate[$m@index]|timeago}</td>
											<td class="less right">{$msize[$m@index]|fsize_format:"MB"}</td>
											<td class="icon_nzb"><a
														href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"htmlall"}"><i
															class="fa fa-download text-muted"
															title="Download NZB"></i></a>
												<a href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments"><i
															class="fa fa-comments-o text-muted"
															title="Comments"></i></a>
												<a href="#" class="icon_cart text-muted"><i
															class="fa fa-shopping-cart" title="Send to my Cart"></i></a>
												{if isset($sabintegrated)}
													<a href="#" class="icon_sab text-muted"><i class="fa fa-cloud-download"
																							   title="Send to my Queue"></i></a>
												{/if}
												{if $weHasVortex}
													<a href="#" class="icon_vortex text-muted"><i
																class="fa fa-send-o" title="Send to NZBVortex"></i></a>
												{/if}
											</td>
										</tr>
									{/foreach}
								</table>
								<hr>
								{if $results|@count > 10}
									<div class="row">
										<div class="col-md-8>
											With Selected:
											<div class="nzb_multi_operations">
												{if isset($section) && $section != ''}View:
													<a href="{$smarty.const.WWW_TOP}/{$section}?t={$category}">Covers</a>
													|
													<b>List</b>
													<br/>
												{/if}
												<div class="btn-group">
													<input type="button"
														   class="nzb_multi_operations_download btn btn-sm btn-success"
														   value="Download NZBs"/>
													<input type="button"
														   class="nzb_multi_operations_cart btn btn-sm btn-info"
														   value="Add to Cart"/>
													{if isset($sabintegrated)}
														<input type="button"
															   class="nzb_multi_operations_sab btn btn-sm btn-primary"
															   value="Send to Queue"/>
													{/if}
													{if isset($nzbgetintegrated)}
														<input type="button"
															   class="nzb_multi_operations_nzbget btn btn-sm btn-primary"
															   value="Send to NZBGet"/>
													{/if}
													{if isset($isadmin)}
														<input type="button"
															   class="nzb_multi_operations_edit btn btn-sm btn-warning"
															   value="Edit"/>
														<input type="button"
															   class="nzb_multi_operations_delete btn btn-sm btn-danger"
															   value="Delete"/>
													{/if}
												</div>
											</div>
										</div>
										<div class="col-md-4">
											{$pager}
										</div>
									</div>
								{/if}
							</div>
						</div>
			</form>
		{/foreach}
	</div>
{/if}
