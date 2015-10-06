<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		/* <![CDATA[ */
		var WWW_TOP = "{$smarty.const.WWW_TOP}";
		var SERVERROOT = "{$serverroot}";
		var UID = "{if $loggedin=="true"}{$userdata.id}{else}{/if}";
		var RSSTOKEN = "{if $loggedin=="true"}{$userdata.rsstoken}{else}{/if}";
		/* ]]> */
	</script>
	<meta charset="UTF-8">
	<title>{$page->meta_title}{if $page->meta_title != "" && $site->metatitle != ""} - {/if}{$site->metatitle}</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!-- Newposterwall -->
	<link href="{$smarty.const.WWW_TOP}/themes/omega/styles/posterwall.css" rel="stylesheet" type="text/css" media="screen" />
	<!-- Bootstrap 3.3.4 -->
	<link href="{$smarty.const.WWW_TOP}/themes/omega/bootstrap/css/bootstrap-slate.css" rel="stylesheet"
		  type="text/css"/>
	<!-- Font Awesome Icons -->
	<link href="{$smarty.const.WWW_TOP}/themes/omega/bootstrap/css/font-awesome.min.css" rel="stylesheet"
		  type="text/css"/>
	<!-- Normalize.css -->
	<link href="{$smarty.const.WWW_TOP}/themes_shared/styles/normalize.css" rel="stylesheet" type="text/css">
	<!-- Ionicons -->
	<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
	<!-- Theme style -->
	<link href="{$smarty.const.WWW_TOP}/themes/omega/dist/css/AdminLTE.css" rel="stylesheet" type="text/css"/>
	<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
		  page. However, you can choose any other skin. Make sure you
		  apply the skin class to the body tag so the changes take effect.
	-->
	<!--<link href="{$smarty.const.WWW_TOP}/themes/omega/dist/css/skins/skin-blue.min.css" rel="stylesheet"
		  type="text/css"/>-->
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
{if ($loggedin)=="true"}
	<!--
	  BODY TAG OPTIONS:
	  =================
	  Apply one or more of the following classes to get the
	  desired effect
	  |---------------------------------------------------------|
	  | SKINS         | skin-blue                               |
	  |               | skin-black                              |
	  |               | skin-purple                             |
	  |               | skin-yellow                             |
	  |               | skin-red                                |
	  |               | skin-green                              |
	  |---------------------------------------------------------|
	  |LAYOUT OPTIONS | fixed                                   |
	  |               | layout-boxed                            |
	  |               | layout-top-nav                          |
	  |               | sidebar-collapse                        |
	  |               | sidebar-mini                            |
	  |---------------------------------------------------------|
	  -->
	<body class="skin-black sidebar-mini layout-boxed sidebar-collapse">
	<div>
		<!-- Main Header -->
		<header class="main-header">
			<!-- Logo -->
			<a href="{$site->home_link}" class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>N</b>Tm</span>
				<!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>{$site->title}</b></span>
			</a>
			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				{$header_menu}
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button -->
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<!-- The user image in the navbar-->
								<img src="{$smarty.const.WWW_TOP}/themes_shared/images/userimage.png"
									 height="20px" class="user-image" alt="User Image"/>
								<!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">{$userdata.username}</span>
							</a>
							<ul class="dropdown-menu">
								<!-- The user image in the menu -->
								<li class="user-header">
									<img src="{$smarty.const.WWW_TOP}/themes_shared/images/userimage.png"
										 height="200px" class="img-circle" alt="User Image"/>
									<p>
										{$userdata.username}
										<small>{$userdata.rolename}</small>
									</p>
								</li>
								<!-- Menu Body -->
								<li class="user-body">
									<div class="col-xs-12 text-center">
										<a href="{$serverroot}cart"><i class="fa fa-shopping-cart"></i> My Cart</a>
									</div>
									<div class="col-xs-12 text-center">
										<a href="{$serverroot}queue"><i class="fa fa-list-alt"></i> My Queue</a>
									</div>
									<div class="col-xs-12 text-center">
										<a href="{$serverroot}mymovies"><i class="fa fa-film"></i> My Movies</a>
									</div>
									<div class="col-xs-12 text-center">
										<a href="{$serverroot}profileedit"><i class="fa fa-cog fa-spin"></i> Account Settings</a>
									</div>
									{if isset($isadmin)}
										<div class="col-xs-12 text-center">
											<a href="{$serverroot}admin"><i class="fa fa-cogs fa-spin"></i> Admin</a>
										</div>
									{/if}
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="{$serverroot}profile" class="btn btn-default btn-flat"><i
													class="fa fa-user"></i> Profile</a>
									</div>
									<div class="pull-right">
										<a href="{$serverroot}logout" class="btn btn-default btn-flat"><i
													class="fa fa-unlock-alt"></i> Sign out</a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</header>
				<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar Menu -->
				<ul class="sidebar-menu">
					<li class="header">Main</li>
					{if ($loggedin)=="true"}
					<!-- Optionally, you can add icons to the links -->
					<li><a href="{$site->home_link}"><i class="fa fa-home"></i><span> Home</span> <span
									class="fa arrow"></span></a></li>
					<li class="treeview">
						<a href="#"><i class="fa fa-list-ol"></i><span> Browse</span></a>
						<ul class="treeview-menu">
							<li><a href="{$serverroot}newposterwall"><i
											class="fa fa-fire"></i><span> New Releases</span></a></li>
							<li><a href="{$serverroot}console"><i
											class="fa fa-gamepad"></i><span> Console</span></a></li>
							<li><a href="{$serverroot}movies"><i
											class="fa fa-film"></i><span> Movies</span></a></li>
							<li><a href="{$serverroot}music"><i
											class="fa fa-music"></i><span> Music</span></a></li>
							<li><a href="{$serverroot}games"><i
											class="fa fa-gamepad"></i><span> Games</span></a></li>
							<li><a href="{$serverroot}series"><i
											class="fa fa-television"></i><span> TV</span></a></li>
							<li><a href="{$serverroot}xxx"><i class="fa fa-venus-mars"></i><span> Adult</span></a></li>
							<li><a href="{$serverroot}books"><i class="fa fa-book"></i><span> Books</span></a></li>
							<li><a href="{$serverroot}browse"><i
											class="fa fa-list-ul"></i><span> Browse All Releases</span></a></li>
							<li><a href="{$serverroot}prehash"><i class="fa fa-list-ol"></i><span> PreHash</span></a>
							</li>
							<li><a href="{$serverroot}predb"><i class="fa fa-list-alt"></i><span> PreDB</span></a></li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#"><i class="fa fa-list-ol"></i><span> Articles & Links</span></a>
						<ul class="treeview-menu">
							<li><a href="{$serverroot}contact-us"><i
											class="fa fa-envelope-o"></i><span> Contact</span> <span
											class="fa arrow"></span></a></li>
							<li><a href="{$serverroot}search"><i class="fa fa-search"></i> Search</a></li>
							<li><a href="{$serverroot}rss"><i class="fa fa-rss"></i> RSS Feeds</a></li>
							<li><a href="{$serverroot}apihelp"><i class="fa fa-cloud"></i> API</a></li>
						</ul>
					</li>
					<li><a href="{$serverroot}logout"><i class="fa fa-unlock"></i><span> Sign out</span></a>
						{else}
					<li><a href="{$serverroot}login"><i class="fa fa-lock"></i><span> Login</span></a>
						{/if}
					</li>
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- Main content -->
			<section class="content">
				<!-- Your Page Content Here -->
				{$page->content}
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<div class="pull-right hidden-xs">
				<img src="/themes/omega/dist/img/hypnotoad.png"/>
			</div>
			<!-- Default to the left -->
			<strong>Copyright &copy; {$smarty.now|date_format:"%Y"} <a
						href="https://github.com/DariusIII/">newznab-tmux</a>.</strong> This software is open source,
			released under the GPLv2 license
		</footer>
	</div>
	<!-- ./wrapper -->
	<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 2.1.4 -->
	<script src="{$smarty.const.WWW_TOP}/themes/omega/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="{$smarty.const.WWW_TOP}/themes/omega/bootstrap/js/bootstrap.min.js"
			type="text/javascript"></script>
	<!-- Bootstrap hover on mouseover script -->
	<script type="text/javascript"
			src="{$smarty.const.WWW_TOP}/themes/omega/plugins/hover/bootstrap-hover-dropdown.min.js"></script>
	<!-- AdminLTE App -->
	<script src="{$smarty.const.WWW_TOP}/themes/omega/dist/js/app.min.js" type="text/javascript"></script>
	<!-- jQuery migrate script -->
	<script type="text/javascript"
			src="{$smarty.const.WWW_TOP}/themes/omega/plugins/migrate/jquery-migrate-1.2.1.min.js"></script>
	<!-- SlimScroll script -->
	<script src="{$smarty.const.WWW_TOP}/themes/omega/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- Fastclick script -->
	<script src="{$smarty.const.WWW_TOP}/themes/omega/plugins/fastclick/fastclick.min.js"></script>
	<!-- Notification script -->
	<script src="{$smarty.const.WWW_TOP}/themes/omega/plugins/noty/packaged/jquery.noty.packaged.min.js"></script>
	<!-- Custom functions -->
	<script src="{$smarty.const.WWW_TOP}/themes/omega/dist/js/functions.js" type="text/javascript"></script>
	<!-- data table plugin -->
	<script type="text/javascript"
			src='{$smarty.const.WWW_TOP}/themes/omega/dist/js/jquery.dataTables.min.js'></script>
	<!-- newznab default scripts, needed for stuff to work -->
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/themes/omega/scripts/jquery.colorbox-min.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/themes/omega/scripts/jquery.autosize-min.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/themes/omega/scripts/jquery.qtip2.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/themes/omega/scripts/sorttable.js"></script>
	<!-- Newznab utils.js -->
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/themes/omega/scripts/utils.js"></script>
	<!-- Optionally, you can add Slimscroll and FastClick plugins.
		  Both of these plugins are recommended to enhance the
		  user experience. Slimscroll is required when using the
		  fixed layout. -->
	</body>
{elseif $smarty.server.REQUEST_URI == "/register" || $smarty.server.REQUEST_URI eq '/register?action=submit'}
	{include file="register.tpl"}
{elseif $smarty.server.REQUEST_URI == "/forgottenpassword" || $smarty.server.REQUEST_URI eq '/forgottenpassword?action=submit'}
	{include file="forgottenpassword.tpl"}
{elseif $smarty.server.REQUEST_URI == "/contact-us"}
	{include file="contact.tpl"}
{elseif $smarty.server.REQUEST_URI == "/terms-and-conditions"}
	{include file="terms.tpl"}
{else}
	{include file="login.tpl"}
{/if}
</html>
