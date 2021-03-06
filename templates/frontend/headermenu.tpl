<div id="menucontainer">
	<div class="collapse navbar-collapse nav navbar-nav top-menu">
		{if $loggedin=="true"}
			{foreach from=$parentcatlist item=parentcat}
				{if ($parentcat.id == 5000)}
					<li class="nav-parent">
						<a href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"
						   data-delay="30">
							<i class="fa fa-television"></i> {$parentcat.title}<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="{$smarty.const.WWW_TOP}/browse?t={$parentcat.id}">TV</a></li>
							<hr>
							<li><a href="{$smarty.const.WWW_TOP}/series">TV Series</a></li>
							<li><a href="{$smarty.const.WWW_TOP}/calendar">TV Calendar</a></li>
							<li><a href="{$smarty.const.WWW_TOP}/anime">Anime Series</a></li>
							<li><a href="{$smarty.const.WWW_TOP}/myshows">My Shows</a></li>
							<hr>
							{foreach from=$parentcat.subcatlist item=subcat}
								<li><a href="{$smarty.const.WWW_TOP}/browse?t={$subcat.id}">{$subcat.title}</a></li>
							{/foreach}
						</ul>
					</li>
				{elseif $parentcat.id == 2000}
					<li class="nav-parent">
						<a href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"
						   data-delay="30">
							<i class="fa fa-film"></i> {$parentcat.title}<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							{if $userdata.movieview == "1"}
								<li><a href="{$smarty.const.WWW_TOP}/movies">{$parentcat.title}</a></li>
							{elseif $userdata.movieview != "1"}
								<li><a href="{$smarty.const.WWW_TOP}/browse?t=2000">{$parentcat.title}</a></li>
							{/if}
							<hr>
							<li><a href="{$smarty.const.WWW_TOP}/upcoming">In Theatre</a></li>
							<li><a href="{$smarty.const.WWW_TOP}/mymovies">My Movies</a></li>
							<hr>
							{if $userdata.movieview == "1"}
								{foreach from=$parentcat.subcatlist item=subcat}
									<li><a href="{$smarty.const.WWW_TOP}/movies?t={$subcat.id}">{$subcat.title}</a></li>
								{/foreach}
							{elseif $userdata.movieview != "1"}
								{foreach from=$parentcat.subcatlist item=subcat}
									<li><a href="{$smarty.const.WWW_TOP}/browse?t={$subcat.id}">{$subcat.title}</a></li>
								{/foreach}
							{/if}
						</ul>
					</li>
				{elseif $parentcat.id == 4000}
					<li class="nav-parent">
						<a href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"
						   data-delay="30">
							<i class="fa fa-gamepad"></i> {$parentcat.title}<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							{if $userdata.gameview == "1"}
								<li><a href="{$smarty.const.WWW_TOP}/games">{$parentcat.title}</a></li>
							{elseif $userdata.gameview != "1"}
								<li><a href="{$smarty.const.WWW_TOP}/browse?t=4000">{$parentcat.title}</a></li>
							{/if}
							<hr>
							{if $userdata.gameview == "1"}
								{foreach from=$parentcat.subcatlist item=subcat}
									{if $subcat.id == 4050}
										<li><a href="{$smarty.const.WWW_TOP}/games?t={$subcat.id}">{$subcat.title}</a>
										</li>
									{else}
										<li><a href="{$smarty.const.WWW_TOP}/browse?t={$subcat.id}">{$subcat.title}</a>
										</li>
									{/if}
								{/foreach}
							{elseif $userdata.gameview != "1"}
								{foreach from=$parentcat.subcatlist item=subcat}
									<li><a href="{$smarty.const.WWW_TOP}/browse?t={$subcat.id}">{$subcat.title}</a></li>
								{/foreach}
							{/if}
						</ul>
					</li>
				{elseif $parentcat.id == 3000}
					<li class="nav-parent">
						<a href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"
						   data-delay="30">
							<i class="fa fa-music"></i> {$parentcat.title}<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							{if $userdata.musicview == "1"}
								<li><a href="{$smarty.const.WWW_TOP}/music">{$parentcat.title}</a></li>
							{elseif $userdata.musicview != "1"}
								<li><a href="{$smarty.const.WWW_TOP}/browse?t=3000">{$parentcat.title}</a></li>
							{/if}
							<hr>
							{if $userdata.musicview == "1"}
								{foreach from=$parentcat.subcatlist item=subcat}
									<li><a href="{$smarty.const.WWW_TOP}/music?t={$subcat.id}">{$subcat.title}</a></li>
								{/foreach}
							{elseif $userdata.musicview != "1"}
								{foreach from=$parentcat.subcatlist item=subcat}
									<li><a href="{$smarty.const.WWW_TOP}/browse?t={$subcat.id}">{$subcat.title}</a></li>
								{/foreach}
							{/if}
						</ul>
					</li>
				{elseif $parentcat.id == 7000}
					<li class="nav-parent">
						<a href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"
						   data-delay="30">
							<i class="fa fa-book"></i> Books<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							{if $userdata.bookview == "1"}
								<li><a href="{$smarty.const.WWW_TOP}/books">{$parentcat.title}</a></li>
							{elseif $userdata.bookview != "1"}
								<li><a href="{$smarty.const.WWW_TOP}/browse?t=7000">{$parentcat.title}</a></li>
							{/if}
							<hr>
							{foreach from=$parentcat.subcatlist item=subcat}
								<li><a href="{$smarty.const.WWW_TOP}/browse?t={$subcat.id}">{$subcat.title}</a></li>
							{/foreach}
						</ul>
					</li>
				{elseif $parentcat.id == 6000}
					<li class="nav-parent">
						<a href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"
						   data-delay="30">
							<i class="fa fa-venus-mars"></i> Adult<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							{if $userdata.xxxview == "1"}
								<li><a href="{$smarty.const.WWW_TOP}/xxx">{$parentcat.title}</a></li>
							{elseif $userdata.xxxview != "1"}
								<li><a href="{$smarty.const.WWW_TOP}/browse?t=6000">{$parentcat.title}</a></li>
							{/if}
							<hr>
							{if $userdata.xxxview == "1"}
								{foreach from=$parentcat.subcatlist item=subcat}
									{if $subcat.id == 6010 OR $subcat.id == 6020 OR $subcat.id == 6030 OR $subcat.id == 6040}
										<li><a href="{$smarty.const.WWW_TOP}/xxx?t={$subcat.id}">{$subcat.title}</a>
										</li>
									{else}
										<li><a href="{$smarty.const.WWW_TOP}/browse?t={$subcat.id}">{$subcat.title}</a>
										</li>
									{/if}
								{/foreach}
							{elseif $userdata.xxxview != "1"}
								{foreach from=$parentcat.subcatlist item=subcat}
									<li><a href="{$smarty.const.WWW_TOP}/browse?t={$subcat.id}">{$subcat.title}</a></li>
								{/foreach}
							{/if}
						</ul>
					</li>
				{/if}
			{/foreach}
			<li class="nav-parent">
				<a href="#" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" data-delay="30">
					<i class="fa fa-bolt"></i> Misc<i class="fa fa-angle-down"></i>
				</a>
				<ul class="dropdown-menu">
					<li><a href="/browse?t=8000">Misc</a></li>
					<li><a href="/browse?t=8020">Hashed</a></li>
					<li><a href="/browse?t=8010">Other</a></li>
					<hr>
					<li><a href="/browse">All</a></li>
					<li><a href="/browsegroup">Browse Groups</a></li>
				</ul>
			</li>
			<!-- End If logged in -->
		{/if}
		<!-- search form -->
		<form class="navbar-form navbar-left" role="search" id="headsearch_form" action="{$smarty.const.WWW_TOP}/search/" method="get">
		<div class="form-group">
			<select id="headcat" name="t" class="form-control" data-search="true">
				<option class="grouping" value="-1">All</option>
				{foreach from=$parentcatlist item=parentcat}
					<option {if $header_menu_cat==$parentcat.id}selected="selected"{/if} value="{$parentcat.id}">{$parentcat.title}</option>
					{foreach from=$parentcat.subcatlist item=subcat}
						<option {if $header_menu_cat==$subcat.id}selected="selected"{/if} value="{$subcat.id}">&nbsp;&nbsp;&nbsp; > {$subcat.title}</option>
					{/foreach}
				{/foreach}
			</select>
			<div class="input-group">
				<input id="headsearch" name="search" value="{if $header_menu_search == ""}Search...{else}{$header_menu_search|escape:"htmlall"}{/if}" class="form-control" type="text" tabindex="1$" />
				<span class="input-group-btn">
					<button id="headsearch_go" type="submit" class="btn btn-default">Go</button>
				</span>
			</div>
		</div>
		</form>
		
		<!-- /.search form -->
	</div>
</div>
