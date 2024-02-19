<?php
//  echo "<pre>";
// print_r($this->session->userdata('userName'));
// die;
?>
<!DOCTYPE html>
<!-- 
Jampack
Author: Hencework
Contact: contact@hencework.com
-->
<html lang="en">

<!-- Mirrored from hencework.com/theme/jampack/classic/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Feb 2024 09:46:28 GMT -->
<head>
    <!-- Meta Tags -->
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jampack - Admin CRM Dashboard Template</title>
    <meta name="description" content="A modern CRM Dashboard Template with reusable and flexible components for your SaaS web applications by hencework. Based on Bootstrap."/>
    
	<!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
	
	<!-- Daterangepicker CSS -->
    <link href="/themes/admin/vendors/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />

	<!-- Data Table CSS -->
    <link href="/themes/admin/vendors/datatables.net-bs5/css/dataTables.bootstrap5.min.css" rel="stylesheet" type="text/css" />
    <link href="/themes/admin/vendors/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css" rel="stylesheet" type="text/css" />

	<!-- CSS -->
    <link href="/themes/admin/dist/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Wrapper -->
	<div class="hk-wrapper" data-layout="vertical" data-layout-style="default" data-menu="light" data-footer="simple">
		<!-- Top Navbar -->
		<nav class="hk-navbar navbar navbar-expand-xl navbar-light fixed-top">
			<div class="container-fluid">
			<!-- Start Nav -->
			<div class="nav-start-wrap">
				<button class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover navbar-toggle d-xl-none"><span class="icon"><span class="feather-icon"><i data-feather="align-left"></i></span></span></button>
					
				<!-- Search -->
				<form class="dropdown navbar-search">
					<div class="dropdown-toggle no-caret" data-bs-toggle="dropdown" data-dropdown-animation data-bs-auto-close="outside">
						<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover  d-xl-none"><span class="icon"><span class="feather-icon"><i data-feather="search"></i></span></span></a>
						<div class="input-group d-xl-flex d-none">
							<span class="input-affix-wrapper input-search affix-border">
								<input type="text" class="form-control  bg-transparent"  data-navbar-search-close="false" placeholder="Search..." aria-label="Search">
								<span class="input-suffix"><span>/</span>
									<span class="btn-input-clear"><i class="bi bi-x-circle-fill"></i></span>
									<span class="spinner-border spinner-border-sm input-loader text-primary" role="status">
										<span class="sr-only">Loading...</span>
									</span>
								</span>
							</span>
						</div>
					</div>
					<div  class="dropdown-menu p-0">
						<!-- Mobile Search -->
						<div class="dropdown-item d-xl-none bg-transparent">
							<div class="input-group mobile-search">
								<span class="input-affix-wrapper input-search">
									<input type="text" class="form-control" placeholder="Search..." aria-label="Search">
									<span class="input-suffix">
										<span class="btn-input-clear"><i class="bi bi-x-circle-fill"></i></span>
										<span class="spinner-border spinner-border-sm input-loader text-primary" role="status">
											<span class="sr-only">Loading...</span>
										</span>
									</span>
								</span>
							</div>
						</div>
						<!--/ Mobile Search -->
						<div data-simplebar class="dropdown-body p-2">
							<h6 class="dropdown-header">Recent Search
							</h6>
							<div class="dropdown-item bg-transparent">
								<a href="#" class="badge badge-pill badge-soft-secondary">Grunt</a>
								<a href="#" class="badge badge-pill badge-soft-secondary">Node JS</a>
								<a href="#" class="badge badge-pill badge-soft-secondary">SCSS</a>
							</div>
							<div class="dropdown-divider"></div>
							<h6 class="dropdown-header">Help
							</h6>
							<a href="javascript:void(0);" class="dropdown-item">
								<div class="media align-items-center">
									<div class="media-head me-2">
										<div class="avatar avatar-icon avatar-xs avatar-soft-light avatar-rounded">
											<span class="initial-wrap">
												<span class="svg-icon">
													<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-corner-down-right" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
														<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
														<path d="M6 6v6a3 3 0 0 0 3 3h10l-4 -4m0 8l4 -4"></path>
													 </svg>
												</span>
											</span>
										</div>
									</div>
									<div class="media-body">
										How to setup theme?
									</div>
								</div>
							</a>
							<a href="javascript:void(0);" class="dropdown-item">
								<div class="media align-items-center">
									<div class="media-head me-2">
										<div class="avatar avatar-icon avatar-xs avatar-soft-light avatar-rounded">
											<span class="initial-wrap">
												<span class="svg-icon">
													<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-corner-down-right" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
														<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
														<path d="M6 6v6a3 3 0 0 0 3 3h10l-4 -4m0 8l4 -4"></path>
													 </svg>
												</span>
											</span>
										</div>
									</div>
									<div class="media-body">
										View detail documentation
									</div>
								</div>
							</a>
							<div class="dropdown-divider"></div>
							<h6 class="dropdown-header">Users
							</h6>
							<a href="javascript:void(0);" class="dropdown-item">
								<div class="media align-items-center">
									<div class="media-head me-2">
										<div class="avatar avatar-xs avatar-rounded">
											<img src="/themes/admin/dist/img/avatar3.jpg" alt="user" class="avatar-img">
										</div>
									</div>
									<div class="media-body">
										Sarah Jone
									</div>
								</div>
							</a>
							<a href="javascript:void(0);" class="dropdown-item">
								<div class="media align-items-center">
									<div class="media-head me-2">
										<div class="avatar avatar-xs avatar-soft-primary avatar-rounded">
											<span class="initial-wrap">J</span>
										</div>
									</div>
									<div class="media-body">
										Joe Jackson
									</div>
								</div>
							</a>
							<a href="javascript:void(0);" class="dropdown-item">
								<div class="media align-items-center">
									<div class="media-head me-2">
										<div class="avatar avatar-xs avatar-rounded">
											<img src="/themes/admin/dist/img/avatar4.jpg" alt="user" class="avatar-img">
										</div>
									</div>
									<div class="media-body">
										Maria Richard
									</div>
								</div>
							</a>
						</div>
						<div class="dropdown-footer d-xl-flex d-none"><a href="#"><u>Search all</u></a></div>
					</div>
				</form>
				<!-- /Search -->
			</div>
			<!-- /Start Nav -->
			
			<!-- End Nav -->
			<div class="nav-end-wrap">
				<ul class="navbar-nav flex-row">
					<li class="nav-item">
						<a href="email.html" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover"><span class="icon"><span class=" position-relative"><span class="feather-icon"><i data-feather="inbox"></i></span><span class="badge badge-sm badge-soft-primary badge-sm badge-pill position-top-end-overflow-1">4</span></span></span></a>
					</li>
					<li class="nav-item">
						<div class="dropdown dropdown-notifications">
							<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover dropdown-toggle no-caret" data-bs-toggle="dropdown" data-dropdown-animation role="button" aria-haspopup="true" aria-expanded="false"><span class="icon"><span class="position-relative"><span class="feather-icon"><i data-feather="bell"></i></span><span class="badge badge-success badge-indicator position-top-end-overflow-1"></span></span></span></a>
							<div class="dropdown-menu dropdown-menu-end p-0">
								<h6 class="dropdown-header px-4 fs-6">Notifications<a href="#" class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover"><span class="icon"><span class="feather-icon"><i data-feather="settings"></i></span></span></a>
								</h6>
								<div data-simplebar class="dropdown-body  p-2">
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-rounded avatar-sm">
													<img src="/themes/admin/dist/img/avatar2.jpg" alt="user" class="avatar-img">
												</div>
											</div>
											<div class="media-body">
												<div>
													<div class="notifications-text">Morgan Freeman accepted your invitation to join the team</div>
													<div class="notifications-info">
														<span class="badge badge-soft-success">Collaboration</span>
														<div class="notifications-time">Today, 10:14 PM</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar  avatar-icon avatar-sm avatar-success avatar-rounded">
													<span class="initial-wrap">
														<span class="feather-icon"><i data-feather="inbox"></i></span>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div>
													<div class="notifications-text">New message received from Alan Rickman</div>
													<div class="notifications-info">
														<div class="notifications-time">Today, 7:51 AM</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar  avatar-icon avatar-sm avatar-pink avatar-rounded">
													<span class="initial-wrap">
														<span class="feather-icon"><i data-feather="clock"></i></span>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div>
													<div class="notifications-text">You have a follow up with Jampack Head on Friday, Dec 19 at 9:30 am</div>
													<div class="notifications-info">
														<div class="notifications-time">Yesterday, 9:25 PM</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-sm avatar-rounded">
													<img src="/themes/admin/dist/img/avatar3.jpg" alt="user" class="avatar-img">
												</div>
											</div>
											<div class="media-body">
												<div>
													<div class="notifications-text">Application of Sarah Williams is waiting for your approval</div>
													<div class="notifications-info">
														<div class="notifications-time">Today 10:14 PM</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar avatar-sm avatar-rounded">
													<img src="/themes/admin/dist/img/avatar10.jpg" alt="user" class="avatar-img">
												</div>
											</div>
											<div class="media-body">
												<div>	
													<div class="notifications-text">Winston Churchil shared a document with you</div>
													<div class="notifications-info">
														<span class="badge badge-soft-violet">File Manager</span>
														<div class="notifications-time">2 Oct, 2021</div>
													</div>
												</div>
											</div>
										</div>
									</a>
									<a href="javascript:void(0);" class="dropdown-item">
										<div class="media">
											<div class="media-head">
												<div class="avatar  avatar-icon avatar-sm avatar-danger avatar-rounded">
													<span class="initial-wrap">
														<span class="feather-icon"><i data-feather="calendar"></i></span>
													</span>
												</div>
											</div>
											<div class="media-body">
												<div>	
													<div class="notifications-text">Last 2 days left for the project to be completed</div>
													<div class="notifications-info">
														<span class="badge badge-soft-orange">Updates</span>
														<div class="notifications-time">14 Sep, 2021</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-footer"><a href="#"><u>View all notifications</u></a></div>
							</div>
						</div>
					</li>
					<li class="nav-item">
						<div class="dropdown ps-2">
							<a class=" dropdown-toggle no-caret" href="#" role="button" data-bs-display="static" data-bs-toggle="dropdown" data-dropdown-animation data-bs-auto-close="outside" aria-expanded="false">
								<div class="avatar avatar-rounded avatar-xs">
									<img src="/themes/admin/dist/img/avatar12.jpg" alt="user" class="avatar-img">
								</div>
							</a>
							<div class="dropdown-menu dropdown-menu-end">
								<div class="p-2">
									<div class="media">
										<div class="media-head me-2">
											<div class="avatar avatar-primary avatar-sm avatar-rounded">
												<span class="initial-wrap"><?=substr($this->session->userdata('userName'),0,2)?></span>
											</div>
										</div>
										<div class="media-body">
											<div class="dropdown">
												<a href="#" class="d-block dropdown-toggle link-dark fw-medium"  data-bs-toggle="dropdown" data-dropdown-animation data-bs-auto-close="inside"><?=$this->session->userdata('userName')?></a>
												
											</div>
											<div class="fs-7"><?=$this->session->userdata('email')?></div>
											<a href="<?php echo base_url('user/logout'); ?>" class="d-block fs-8 link-secondary"><u>Sign Out</u></a>
										</div>
									</div>
								</div>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="profile.html">Profile</a>
								<a class="dropdown-item" href="#"><span class="me-2">Offers</span><span class="badge badge-sm badge-soft-pink">2</span></a><div class="dropdown-divider"></div>
								<h6 class="dropdown-header">Manage Account</h6>
								<a class="dropdown-item" href="#"><span class="dropdown-icon feather-icon"><i data-feather="credit-card"></i></span><span>Payment methods</span></a>
								<a class="dropdown-item" href="#"><span class="dropdown-icon feather-icon"><i data-feather="check-square"></i></span><span>Subscriptions</span></a>
								<a class="dropdown-item" href="#"><span class="dropdown-icon feather-icon"><i data-feather="settings"></i></span><span>Settings</span></a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#"><span class="dropdown-icon feather-icon"><i data-feather="tag"></i></span><span>Raise a ticket</span></a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Terms & Conditions</a>
								<a class="dropdown-item" href="#">Help & Support</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- /End Nav -->
			</div>									
		</nav>
		<!-- /Top Navbar -->

        <!-- Vertical Nav -->
        <div class="hk-menu">
			<!-- Brand -->
			<div class="menu-header">
				<span>
					<a class="navbar-brand" href="index-2.html">
						<img class="brand-img img-fluid" src="/themes/admin/dist/img/brand-sm.svg" alt="brand" />
						<img class="brand-img img-fluid" src="/themes/admin/dist/img/Jampack.svg" alt="brand" />
					</a>
					<button class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover navbar-toggle">
						<span class="icon">
							<span class="svg-icon fs-5">
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-arrow-bar-to-left" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<line x1="10" y1="12" x2="20" y2="12"></line>
									<line x1="10" y1="12" x2="14" y2="16"></line>
									<line x1="10" y1="12" x2="14" y2="8"></line>
									<line x1="4" y1="4" x2="4" y2="20"></line>
								</svg>
							</span>
						</span>
					</button>
				</span>
			</div>
			<!-- /Brand -->

			<!-- Main Menu -->
			<div data-simplebar class="nicescroll-bar">
				<div class="menu-content-wrap">
					<div class="menu-group">
						<ul class="navbar-nav flex-column">
							<li class="nav-item active">
								<a class="nav-link" href="index-2.html">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-template" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<rect x="4" y="4" width="16" height="4" rx="1" />
												<rect x="4" y="12" width="6" height="8" rx="1" />
												<line x1="14" y1="12" x2="20" y2="12" />
												<line x1="14" y1="16" x2="20" y2="16" />
												<line x1="14" y1="20" x2="20" y2="20" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Dashboard</span>
									<span class="badge badge-sm badge-soft-pink ms-auto">Hot</span>
								</a>
							</li>
						</ul>	
					</div>
					<div class="menu-gap"></div>
					<div class="menu-group">
						<div class="nav-header">
							<span>Apps</span>
						</div>
						<ul class="navbar-nav flex-column">
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_chat">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-message-dots" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<path d="M4 21v-13a3 3 0 0 1 3 -3h10a3 3 0 0 1 3 3v6a3 3 0 0 1 -3 3h-9l-4 4" />
												<line x1="12" y1="11" x2="12" y2="11.01" />
												<line x1="8" y1="11" x2="8" y2="11.01" />
												<line x1="16" y1="11" x2="16" y2="11.01" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Chat</span>
								</a>
								<ul id="dash_chat" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="chats.html"><span class="nav-link-text">Chats</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="chats-group.html"><span class="nav-link-text">Groups</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="chats-contact.html"><span class="nav-link-text">Contacts</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>	
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_chatpop">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-message-circle-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<path d="M3 20l1.3 -3.9a9 8 0 1 1 3.4 2.9l-4.7 1" />
												<line x1="12" y1="12" x2="12" y2="12.01" />
												<line x1="8" y1="12" x2="8" y2="12.01" />
												<line x1="16" y1="12" x2="16" y2="12.01" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Chat Popup</span>
									
								</a>
								<ul id="dash_chatpop" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="chatpopup.html"><span class="nav-link-text">Direct Message</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="chatbot.html"><span class="nav-link-text">Chatbot</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>	
							<li class="nav-item">
								<a class="nav-link" href="calendar.html">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-calendar-time" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<path d="M11.795 21h-6.795a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v4" />
												<circle cx="18" cy="18" r="4" />
												<path d="M15 3v4" />
												<path d="M7 3v4" />
												<path d="M3 11h16" />
												<path d="M18 16.496v1.504l1 1" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Calendar</span>
								</a>
							</li>	
							<li class="nav-item">
								<a class="nav-link" href="email.html">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-inbox" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<rect x="4" y="4" width="16" height="16" rx="2" />
												<path d="M4 13h3l3 3h4l3 -3h3" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Email</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_scrumboard">
									<span class="nav-icon-wrap position-relative">
										<span class="badge badge-sm badge-primary badge-sm badge-pill position-top-end-overflow">3</span>
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-layout-kanban" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<line x1="4" y1="4" x2="10" y2="4" />
												<line x1="14" y1="4" x2="20" y2="4" />
												<rect x="4" y="8" width="6" height="12" rx="2" />
												<rect x="14" y="8" width="6" height="6" rx="2" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Scrumboard</span>
								</a>
								<ul id="dash_scrumboard" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="projects-board.html"><span class="nav-link-text">All Boards</span></a>
											</li>
											
											<li class="nav-item">
												<a class="nav-link" href="kanban-board.html"><span class="nav-link-text">Project Kanban</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="pipeline.html"><span class="nav-link-text">Pipeline Kanban</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_contact">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-notebook" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<path d="M6 4h11a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-11a1 1 0 0 1 -1 -1v-14a1 1 0 0 1 1 -1m3 0v18" />
												<line x1="13" y1="8" x2="15" y2="8" />
												<line x1="13" y1="12" x2="15" y2="12" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Contact</span>
								</a>
								<ul id="dash_contact" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="contact.html"><span class="nav-link-text">Contact List</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="contact-cards.html"><span class="nav-link-text">Contact Cards</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="edit-contact.html"><span class="nav-link-text">Edit Contact</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_file">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-check" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<path d="M14 3v4a1 1 0 0 0 1 1h4" />
												<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
												<path d="M9 15l2 2l4 -4" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">File Manager</span>
								</a>
								<ul id="dash_file" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="file-manager-list.html"><span class="nav-link-text">List View</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="file-manager-grid.html"><span class="nav-link-text">Grid View</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>
							<li class="nav-item">
								<a class="nav-link" href="gallery.html">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-photo" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<line x1="15" y1="8" x2="15.01" y2="8" />
												<rect x="4" y="4" width="16" height="16" rx="3" />
												<path d="M4 15l4 -4a3 5 0 0 1 3 0l5 5" />
												<path d="M14 14l1 -1a3 5 0 0 1 3 0l2 2" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Gallery</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_task">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-list-details" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<path d="M13 5h8" />
												<path d="M13 9h5" />
												<path d="M13 15h8" />
												<path d="M13 19h5" />
												<rect x="3" y="4" width="6" height="6" rx="1" />
												<rect x="3" y="14" width="6" height="6" rx="1" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Todo</span>
									<span class="badge badge-soft-success ms-2">2</span>
								</a>
								<ul id="dash_task" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="tasklist.html"><span class="nav-link-text">Tasklist</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="gantt.html"><span class="nav-link-text">Gantt</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_blog">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-browser" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<rect x="4" y="4" width="16" height="16" rx="1" />
												<line x1="4" y1="8" x2="20" y2="8" />
												<line x1="8" y1="4" x2="8" y2="8" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Blog</span>
								</a>
								<ul id="dash_blog" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="posts.html"><span class="nav-link-text">Posts</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="add-new-post.html"><span class="nav-link-text">Add New Post</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="post-detail.html"><span class="nav-link-text">Post Detail</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_invoice">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-digit" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<path d="M14 3v4a1 1 0 0 0 1 1h4" />
												<rect x="9" y="12" width="3" height="5" rx="1" />
												<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
												<path d="M15 12v5" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Invoices</span>
								</a>
								<ul id="dash_invoice" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="invoice-list.html"><span class="nav-link-text">Invoice List</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="invoice-templates.html"><span class="nav-link-text">Invoice Templates</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="create-invoice.html"><span class="nav-link-text">Create Invoice</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="invoice-preview.html"><span class="nav-link-text">Invoice Preview</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_integ">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-code" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<polyline points="7 8 3 12 7 16" />
												<polyline points="17 8 21 12 17 16" />
												<line x1="14" y1="4" x2="10" y2="20" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Integrations</span>
								</a>
								<ul id="dash_integ" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="all-apps.html"><span class="nav-link-text">All Apps</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="integrations-detail.html"><span class="nav-link-text">App Detail</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="integrations.html"><span class="nav-link-text">Integrations</span></a>
											</li>
										</ul>	
									</li>	
								</ul>	
							</li>
						</ul>
					</div>
					<div class="menu-gap"></div>
					<div class="menu-group">
						<div class="nav-header">
							<span>Pages</span>
						</div>
						<ul class="navbar-nav flex-column">
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_pages">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<circle cx="9" cy="7" r="4" />
												<path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" />
												<path d="M16 11h6m-3 -3v6" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Authentication</span>
								</a>
								<ul id="dash_pages" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_log">
													<span class="nav-link-text">Log In</span> 
												</a>
												<ul id="dash_log" class="nav flex-column collapse  nav-children">
													<li class="nav-item">
														<ul class="nav flex-column">
															<li class="nav-item">
																<a class="nav-link" href="login.html"><span class="nav-link-text">Login</span></a>
															</li>
															<li class="nav-item">
																<a class="nav-link" href="login-simple.html"><span class="nav-link-text">Login Simple</span></a>
															</li>
															<li class="nav-item">
																<a class="nav-link" href="login-classic.html"><span class="nav-link-text">Login Classic</span></a>
															</li>
														</ul>	
													</li>	
												</ul>	
											</li>
											<li class="nav-item">
												<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_sign">
													<span class="nav-link-text">Sign Up</span>
												</a>
												<ul id="dash_sign" class="nav flex-column collapse  nav-children">
													<li class="nav-item">
														<ul class="nav flex-column">
															<li class="nav-item">
																<a class="nav-link" href="signup.html"><span class="nav-link-text">Signup</span></a>
															</li>
															<li class="nav-item">
																<a class="nav-link" href="signup-simple.html"><span class="nav-link-text">Signup Simple</span></a>
															</li>
															<li class="nav-item">
																<a class="nav-link" href="signup-classic.html"><span class="nav-link-text">Signup Classic</span></a>
															</li>
														</ul>		
													</li>	
												</ul>	
											</li>
											<li class="nav-item">
												<a class="nav-link" href="lock-screen.html"><span class="nav-link-text">Lock Screen</span></a>
											</li>
											
											<li class="nav-item">
												<a class="nav-link" href="reset-password.html"><span class="nav-link-text">Reset Password</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="404.html"><span class="nav-link-text">Error 404</span></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="503.html"><span class="nav-link-text">Error 503</span></a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#dash_profile">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user-search" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<circle cx="12" cy="7" r="4" />
												<path d="M6 21v-2a4 4 0 0 1 4 -4h1" />
												<circle cx="16.5" cy="17.5" r="2.5" />
												<path d="M18.5 19.5l2.5 2.5" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text position-relative">Profile
										<span class="badge badge-danger badge-indicator position-absolute top-0 start-100"></span>
									</span>
								</a>
								<ul id="dash_profile" class="nav flex-column collapse  nav-children">
									<li class="nav-item">
										<ul class="nav flex-column">
											<li class="nav-item">
												<a class="nav-link" href="profile.html">
													<span class="nav-link-text">Profile</span>
												</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="edit-profile.html">
													<span class="nav-link-text">Edit Profile</span>
												</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" href="account.html">
													<span class="nav-link-text">Account</span>
												</a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="menu-gap"></div>
					<div class="menu-group">
						<div class="nav-header">
							<span>Documentation</span>
						</div>
						<ul class="navbar-nav flex-column">
							<li class="nav-item">
								<a class="nav-link" href="https://nubra-ui.hencework.com/" target="_blank">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-file-code-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<path d="M10 12h-1v5h1" />
												<path d="M14 12h1v5h-1" />
												<path d="M14 3v4a1 1 0 0 0 1 1h4" />
												<path d="M17 21h-10a2 2 0 0 1 -2 -2v-14a2 2 0 0 1 2 -2h7l5 5v11a2 2 0 0 1 -2 2z" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Documentation</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="https://nubra-ui.hencework.com/avatar.html" target="_blank">
									<span class="nav-icon-wrap">
										<span class="svg-icon">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-layout" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
												<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
												<rect x="4" y="4" width="6" height="5" rx="2" />
												<rect x="4" y="13" width="6" height="7" rx="2" />
												<rect x="14" y="4" width="6" height="16" rx="2" />
											</svg>
										</span>
									</span>
									<span class="nav-link-text">Components</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="callout card card-flush bg-orange-light-5 text-center mt-5 w-220p mx-auto">
						<div class="card-body">
							<h5 class="h5">Quickly Build Applications</h5>
							<p class="p-sm card-text">Exclusively for webapps Based on Bootstrap</p>
							<a href="https://nubra-ui.hencework.com/" target="_blank" class="btn btn-primary btn-block">Go Nubra-UI</a>
						</div>
					</div>
				</div>
			</div>
			<!-- /Main Menu -->
		</div>
        <div id="hk_menu_backdrop" class="hk-menu-backdrop"></div>
        <!-- /Vertical Nav -->
		<?php echo $template['body']; ?>	
		<!-- Chat Popup -->
		<div class="hk-chatbot-popup">
			<header>
				<div class="chatbot-head-top">
					<a class="btn btn-sm btn-icon btn-dark btn-rounded" href="javascript:void(0);" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span>
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#"><i class="dropdown-icon zmdi zmdi-notifications-active"></i><span>Send push notifications</span></a>
						<a class="dropdown-item" href="#"><i class="dropdown-icon zmdi zmdi-volume-off"></i><span>Mute Chat</span></a>
					</div>
					<span class="text-white">Chat with Us</span>
					<a id="minimize_chatbot" href="javascript:void(0);" class="btn btn-sm btn-icon btn-dark btn-rounded">
						<span class="icon"><span class="feather-icon"><i data-feather="minus"></i></span></span>
					</a>
				</div>
				<div class="separator-full separator-light mt-0 opacity-10"></div>
				<div class="media-wrap">
					<div class="media">
						<div class="media-head">
							<div class="avatar avatar-sm avatar-soft-primary avatar-icon avatar-rounded position-relative">
								<span class="initial-wrap">
									<i class="ri-customer-service-2-line"></i>
								</span>
								<span class="badge badge-success badge-indicator badge-indicator-lg badge-indicator-nobdr position-bottom-end-overflow-1"></span>
							</div>
						</div>
						<div class="media-body">
							<div class="user-name">Chat Robot</div>
							<div class="user-status">Online</div>
						</div>
					</div>
				</div>
			</header>
			<div class="chatbot-popup-body">
				<div data-simplebar class="nicescroll-bar">
					<div>
						<div class="init-content-wrap">
							<div class="card card-shadow">
								<div class="card-body">
									<p class="card-text">Hey I am chat robot 😈<br>Do yo have any question regarding our tools?<br><br>Select the topic or start chatting.</p>
									<button class="btn btn-block btn-primary text-nonecase start-conversation">Start a conversation</button>
								</div>
							</div>
							<div class="btn-wrap">
								<button class="btn btn-soft-primary text-nonecase btn-rounded start-conversation"><span><span class="icon"><span class="feather-icon"><i data-feather="eye"></i></span></span><span class="btn-text">Just browsing</span></span></button>
								<button class="btn btn-soft-danger text-nonecase btn-rounded start-conversation"><span><span class="icon"><span class="feather-icon"><i data-feather="credit-card"></i></span></span><span class="btn-text">I have a question regarding pricing</span></span></button>
								<button class="btn btn-soft-warning text-nonecase btn-rounded start-conversation"><span><span class="icon"><span class="feather-icon"><i data-feather="cpu"></i></span></span><span class="btn-text">Need help for technical query</span></span></button>
								<button class="btn btn-soft-success text-nonecase btn-rounded start-conversation"><span><span class="icon"><span class="feather-icon"><i data-feather="zap"></i></span></span><span class="btn-text">I have a pre purchase question</span></span></button>
							</div>
						</div>
						<ul class="list-unstyled d-none">
							<li class="media sent">
								<div class="media-body">
									<div class="msg-box">
										<div>
											<p>I have a plan regarding pricing</p>
										</div>
									</div>
								</div>
							</li>
							<li class="media received">
								<div class="avatar avatar-xs avatar-soft-primary avatar-icon avatar-rounded">
									<span class="initial-wrap">
										<i class="ri-customer-service-2-line"></i>
									</span>
								</div>
								<div class="media-body">
									<div class="msg-box">
										<div>
											<p>Welcome back!<br>Are you looking to upgrade your existing plan?</p>
										</div>
									</div>
									<div class="msg-box typing-wrap">
										<div>
											<div class="typing">
											  <div class="dot"></div>
											  <div class="dot"></div>
											  <div class="dot"></div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<footer>
				<div class="chatbot-intro-text fs-7">
					<div class="separator-full separator-light"></div>
					<p class="mb-2">This is jampack's beta version please sign up now to get early access to our full version</p>
					<a class="d-block mb-2" href="#"><u>Give Feedback</u></a>		
				</div>
				<div class="input-group d-none">
					<div class="input-group-text overflow-show border-0">
						<button class="btn btn-icon btn-flush-dark flush-soft-hover btn-rounded dropdown-toggle no-caret" data-bs-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
							<span class="icon"><span class="feather-icon"><i data-feather="share"></i></span></span>
						</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">
								<div class="d-flex align-items-center">
									<div class="avatar avatar-icon avatar-xs avatar-soft-primary avatar-rounded me-3">
										<span class="initial-wrap">
											<i class="ri-image-line"></i>
										</span>
									</div>
									<div>
										<span class="h6 mb-0">Photo or Video Library</span>
									</div>
								</div>
							</a>
							<a class="dropdown-item" href="#">
								<div class="d-flex align-items-center">
									<div class="avatar avatar-icon avatar-xs avatar-soft-info avatar-rounded me-3">
										<span class="initial-wrap">
											<i class="ri-file-4-line"></i>
										</span>
									</div>
									<div>
										<span class="h6 mb-0">Documents</span>
									</div>
								</div>
							</a>
							<a class="dropdown-item" href="#">
								<div class="d-flex align-items-center">
									<div class="avatar avatar-icon avatar-xs avatar-soft-success avatar-rounded me-3">
										<span class="initial-wrap">
											<i class="ri-map-pin-line"></i>
										</span>
									</div>
									<div>
										<span class="h6 mb-0">Location</span>
									</div>
								</div>
							</a>
							<a class="dropdown-item" href="#">
								<div class="d-flex align-items-center">
									<div class="avatar avatar-icon avatar-xs avatar-soft-blue avatar-rounded me-3">
										<span class="initial-wrap">
											<i class="ri-contacts-line"></i>
										</span>
									</div>
									<div>
										<span class="h6 mb-0">Contact</span>
									</div>
								</div>
							</a>
						</div>
					</div>
					<input type="text" id="input_msg_chat_popup" name="send-msg" class="input-msg-send form-control border-0 shadow-none" placeholder="Type something...">
					<div class="input-group-text overflow-show border-0">
						<button class="btn btn-icon btn-flush-dark flush-soft-hover btn-rounded">
							<span class="icon"><span class="feather-icon"><i data-feather="smile"></i></span></span>
						</button>
					</div>
				</div>
				<div class="footer-copy-text">Powered by <a class="brand-link" href="#"><img src="/themes/admin/dist/img/logo-light.png" alt="logo-brand"></a></div>
			</footer>
		</div>
		<a href="#" class="btn btn-icon btn-floating btn-primary btn-lg btn-rounded btn-popup-open">
			<span class="icon">
				<span class="feather-icon"><i data-feather="message-circle"></i></span>
			</span>
		</a>
		<div class="chat-popover shadow-xl"><p>Try Jampack Chat for free and connect with your customers now!</p></div>
		<!-- /Chat Popup -->

		<!-- Main Content -->
		<div class="hk-pg-wrapper">
			<div class="container-xxl">
			
			</div>
			
			<!-- Page Footer -->
			<div class="hk-footer">
				<footer class="container-xxl footer">
					<div class="row">
						<div class="col-xl-8">
							<p class="footer-text"><span class="copy-text">Jampack © 2023 All rights reserved.</span> <a href="#" class="" target="_blank">Privacy Policy</a><span class="footer-link-sep">|</span><a href="#" class="" target="_blank">T&C</a><span class="footer-link-sep">|</span><a href="#" class="" target="_blank">System Status</a></p>
						</div>
						<div class="col-xl-4">
							<a href="#" class="footer-extr-link link-default"><span class="feather-icon"><i data-feather="external-link"></i></span><u>Send feedback to our help forum</u></a>
						</div>
					</div>
				</footer>
            </div>
            <!-- / Page Footer -->

		</div>
		<!-- /Main Content -->
	</div>
    <!-- /Wrapper -->

	<!-- jQuery -->
    <script src="/themes/admin/vendors/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JS -->
   	<script src="/themes/admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- FeatherIcons JS -->
    <script src="/themes/admin/dist/js/feather.min.js"></script>

    <!-- Fancy Dropdown JS -->
    <script src="/themes/admin/dist/js/dropdown-bootstrap-extended.js"></script>

	<!-- Simplebar JS -->
	<script src="/themes/admin/vendors/simplebar/dist/simplebar.min.js"></script>
	
	<!-- Data Table JS -->
    <script src="/themes/admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/themes/admin/vendors/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
	<script src="/themes/admin/vendors/datatables.net-select/js/dataTables.select.min.js"></script>

	<!-- Daterangepicker JS -->
    <script src="/themes/admin/vendors/moment/min/moment.min.js"></script>
	<script src="/themes/admin/vendors/daterangepicker/daterangepicker.js"></script>
	<script src="/themes/admin/dist/js/daterangepicker-data.js"></script>

	<!-- Amcharts Maps JS -->
	<script src="/themes/admin/vendors/%40amcharts/amcharts4/core.js"></script>
	<script src="/themes/admin/vendors/%40amcharts/amcharts4/maps.js"></script>
	<script src="/themes/admin/vendors/%40amcharts/amcharts4-geodata/worldLow.js"></script>
	<script src="/themes/admin/vendors/%40amcharts/amcharts4-geodata/worldHigh.js"></script>
	<script src="/themes/admin/vendors/%40amcharts/amcharts4/themes/animated.js"></script>

	<!-- Apex JS -->
	<script src="/themes/admin/vendors/apexcharts/dist/apexcharts.min.js"></script>

	<!-- Init JS -->
	<script src="/themes/admin/dist/js/init.js"></script>
	<script src="/themes/admin/dist/js/chips-init.js"></script>
	<script src="/themes/admin/dist/js/dashboard-data.js"></script>
</body>

<!-- Mirrored from hencework.com/theme/jampack/classic/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Feb 2024 09:47:54 GMT -->
</html>