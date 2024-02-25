
	<?php 
		$totSegments = $this->uri->total_segments();
		$uriSegments = $this->uri->segment($totSegments);
		if(!is_numeric($uriSegments)){
			$offset = 0;
		} else if(is_numeric($uriSegments)){
			$offset = $this->uri->segment($totSegments);
		}
		$limit = 12;
	?>
	
	
	<div class="container">
	
		<div class="row">
	<div class="bg-info">
		<div class="container-fluid first-child">
			<div class="row">
				<div class="col-sm-7  hidden-xs">
				   <span class="Page-title">User <i class="fa fa-angle-double-right"></i> Gallerys <i class="fa fa-angle-double-right"></i></span>
				</div>
				<div class="col-sm-2">
					<div class="col-12-xs">
						<a href="<?php echo base_url('user/snapshots/add'); ?>" class="btn btn-md btn-block btn-primary newPost"><i class="fa fa-plus"></i> &nbsp; Add Image </a>
					</div>
				</div>
			</div>
		</div>
	</div>
				
			<div class="col-md-12 sticky">
				<div class="row grid">

					<?php
						$n = 1;
						$snapshots = getPosts('snapshots', ($this->session->userdata('user_level') == 1 ? null : $this->session->userdata('userID')), null, $limit, $offset);
						if($snapshots)
						{
							foreach($snapshots as $c)
							{
								$btn =($c['home_slider'] == 1)?"success":"default";
								echo '
									<div class="col-sm-3 col-xs-6 grid-item" id="snapshot' . $c['snapshotID'] . '">
										<div class="image-placeholder">
											<a href="' . base_url('snapshots/' . $c['snapshotSlug']) . '" class="ajax"><img width="100%" style="height: 150px;object-fit: cover;"  class="img-responsive" src="' . base_url('uploads/snapshots/thumbs/' . imageCheck('snapshots', $c['snapshotFile'], 1)) . '" alt="' . truncate($c['snapshotContent'], 50) . '" /></a>
											<div class="col-sm-12" style="border-top:1px solid #ddd;padding-top:10px">
												<div class="btn-group btn-group-justified">
													<a class="btn btn-'.$btn.' btn-sm " href="javascript:change_slider_status('.$c['snapshotID'].')" id="slider_'.$c['snapshotID'].'"><i class="btn-icon-only fa fa-home"></i>Slider</a>
													<a class="btn btn-default btn-sm newPost" href="' . base_url('user/snapshots/edit/' . $c['snapshotSlug']) . '"><i class="btn-icon-only fa fa-edit"></i> ' . phrase('edit') . '</a>
													<a class="btn btn-default btn-sm" href="javascript:void(0)" onclick="confirm_modal(\'' . base_url('user/snapshots/remove/' . $c['snapshotSlug']) . '\', \'snapshot' . $c['snapshotID'] . '\')"><i class="btn-icon-only fa fa-times"></i> ' . phrase('remove') . '</a>
												</div>
											</div>
										</div>
									</div>
								';
							}
						}
					?>
					
				</div>
				
				<hr/>
				<div class="row">
					<div class="col-sm-12 text-center">
					
						<?php echo generatePagination('snapshots', null, ($this->session->userdata('user_level') == 1 ? null : $this->session->userdata('userID')), 'user', $limit, $offset); ?>
						
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
	function change_slider_status(id)
	{
		$('#slider_'+id).removeClass('btn-success');
		$('#slider_'+id).removeClass('btn-default');
		
		 $.ajax({
            url:'<?php echo base_url('user/snapshots/change_status') ?>',
            type: "POST",
            data: {"is_ajax": true, 'snapshotID': id},
            success: function (response) {
            	var data = $.parseJSON(response);
    $('#slider_'+id).addClass(data['class']);
		            
            }
        });
	}
</script>

	<!-- Main Content -->
	<div class="hk-pg-wrapper pb-0">
			<!-- Page Body -->
			<div class="hk-pg-body py-0">
				<div class="galleryapp-wrap">
					<nav class="galleryapp-sidebar">
						<div data-simplebar class="nicescroll-bar">
							<div class="menu-content-wrap">
								<div class="btn btn-primary btn-rounded btn-block btn-file mb-4">
									Upload Images
									<input type="file" class="upload">
								</div>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item active">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="hard-drive"></i></span></span>
												<span class="nav-link-text">Gallery</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="folder"></i></span></span>
												<span class="nav-link-text">Collections</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="upload"></i></span></span>
												<span class="nav-link-text">Shared with me</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="star"></i></span></span>
												<span class="nav-link-text">Favorite</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="javascript:void(0);">
												<span class="nav-icon-wrap"><span class="feather-icon"><i data-feather="trash-2"></i></span></span>
												<span class="nav-link-text">Trash</span>
											</a>
										</li>
									</ul>
								</div>
								<div class="separator separator-light"></div>
								<div class="d-flex align-items-center justify-content-between mb-2">
									<div class="title-sm text-primary mb-0">Categories</div>
									<a href="#" class="btn btn-xs btn-icon btn-rounded btn-light" data-bs-toggle="modal" data-bs-target="#add_new_cat"><span class="icon" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Add Category"><span class="feather-icon"><i data-feather="plus"></i></span></span></a>
								</div>
								<div class="menu-group">
									<ul class="nav nav-light navbar-nav flex-column">
										<li class="nav-item">
											<a class="nav-link" href="#">
												<span class="nav-link-text">Images</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#">
												<span class="nav-link-text">Videos</span>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="#">
												<span class="nav-link-text">Audio</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<!--Sidebar Fixnav-->
						<div class="galleryapp-fixednav">
							<div class="hk-toolbar">
								<ul class="nav nav-light">
									<li class="nav-item nav-link">
										<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Settings" href="#"><span class="icon"><span class="feather-icon"><i data-feather="settings"></i></span></span></a>
									</li>
									<li class="nav-item nav-link">
										<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Archive"><span class="icon"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
									</li>
									<li class="nav-item nav-link">
										<a href="#" class="btn btn-icon btn-rounded btn-flush-dark flush-soft-hover" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Help"><span class="icon"><span class="feather-icon"><i data-feather="book"></i></span></span></a>
									</li>
								</ul>
							</div>
						</div>
						<!--/ Sidebar Fixnav-->
					</nav>
					<div class="galleryapp-content">
						<div class="galleryapp-detail-wrap">
							<header class="gallery-header">
								<div class="d-flex align-items-center flex-grow-1">
									<a class="galleryapp-title dropdown-toggle link-dark" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
										<h1>Media Gallery</h1>
									</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="hard-drive"></i></span><span>Gallery</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="folder"></i></span><span>Collections</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="upload"></i></span><span>Shared with me</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="star"></i></span><span>Favorite</span></a>
									</div>
									<form class="mx-3 flex-grow-1 mw-400p" role="search">
										<input type="text" class="form-control" placeholder="Search media by Name">
									</form>
								</div>
								<div class="gallery-options-wrap">	
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover btn-file-download disabled d-xl-inline-block d-none" href="#" ><span class="icon"><span class="feather-icon"><i data-feather="download"></i></span></span></a>
									<div class="v-separator d-xl-inline-block d-none"></div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover ms-0 d-xl-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Add New Folder"><span class="icon"><span class="feather-icon"><i data-feather="folder-plus"></i></span></span></a>
									<a class="btn btn-icon btn-flush-dark btn-rounded btn-file flush-soft-hover  d-md-inline-block d-none" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Upload"><span class="icon"><span class="feather-icon"><i data-feather="upload-cloud"></i></span></span></a>
									<div class="v-separator d-lg-inline-block d-none"></div>
									<a class="btn btn-icon btn-flush-dark flush-soft-hover dropdown-toggle no-caret active ms-lg-0 d-sm-inline-block d-none" href="#" data-bs-toggle="dropdown"><span class="icon"><span class="feather-icon"><i data-feather="list"></i></span></span></a>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item active" href="file-manager-list.html"><span class="feather-icon dropdown-icon"><i data-feather="list"></i></span><span>List View</span></a>
										<a class="dropdown-item" href="file-manager-grid.html"><span class="feather-icon dropdown-icon"><i data-feather="grid"></i></span><span>Grid View</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="server"></i></span><span>Compact View</span></a>
									</div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable" href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Collapse">
										<span class="icon">
											<span class="feather-icon"><i data-feather="chevron-up"></i></span>
											<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
										</span>
									</a>
								</div>
								<div class="hk-sidebar-togglable"></div>
							</header>
							<div class="gallery-body">
								<div data-simplebar class="nicescroll-bar">
									<div class="collapse-simple">
										<div class="card card-border">
											<div class="card-header">
												<a role="button" data-bs-toggle="collapse" href="#gal_collapse_1" aria-expanded="true">
													<h5 class="mb-0">Recently Assigned</h5>
												</a>
											</div>
											<div id="gal_collapse_1" class="collapse show">
												<div class="card-body">
													<div class="row gx-3 row-cols-xxl-6 row-cols-xl-5 row-cols-lg-3 row-cols-md-2 row-cols-1 hk-gallery">
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock1.jpg" style="background-image:url('dist/img/gallery/mock1.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock2.jpg" style="background-image:url('dist/img/gallery/mock2.jpg');">
																</div>
																<span class="gallery-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock3.jpg" style="background-image:url('dist/img/gallery/mock3.jpg');">
																</div>
																<span class="gallery-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock4.jpg" style="background-image:url('dist/img/gallery/mock4.jpg');">
																</div>
																<span class="gallery-star"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock5.jpg" style="background-image:url('dist/img/gallery/mock5.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img gallery-video" data-sub-html="#caption" data-src="https://www.youtube.com/watch?v=BvXR97eR1QE" data-poster="dist/img/gallery/mock6.jpg" data-sub-html="#caption3" style="background-image:url('dist/img/gallery/mock6.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
													</div>
													<div id="caption" style="display:none">
														<div class="gallery-info h-100">
															<div data-simplebar class="nicescroll-bar">
																<header class="gallery-header">
																	<div>
																		<div class="file-name">bruce-mars-flEG-pk6Z</div>
																		<span class="fs-7">JPG File</span>
																	</div>
																	<div class="gallery-options-wrap">	
																		<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" href="#"><span class="icon"><span class="feather-icon"><i data-feather="link-2"></i></span></span></a>
																		<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" href="#"><span class="icon"><span class="feather-icon"><i data-feather="more-horizontal"></i></span></span></a>
																	</div>
																</header>
																<div class="gallery-detail-body">
																	<div class="collapse-simple">
																		<div class="card">
																			<div class="card-header">
																				<a role="button" data-bs-toggle="collapse" href="#fl_info" aria-expanded="true">Specification</a>
																			</div>
																			<div id="fl_info" class="collapse show">
																				<div class="card-body">
																					<ul class="file-info">
																						<li>
																							<span>Date Modified</span>
																							<span>20 Nov,2020</span>
																						</li>
																						<li>
																							<span>Size</span>
																							<span>15.2 GB</span>
																						</li>
																						<li>
																							<span>Created by</span>
																							<span>Morgan Freeman</span>
																						</li>
																						<li>
																							<span>Date Created</span>
																							<span>12 Nov,2020</span>
																						</li>
																						<li>
																							<span>Dimension</span>
																							<span>1920 x 1245</span>
																						</li>
																						<li><span class="text-danger">Delete Permanently</span></li>
																					</ul>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="separator separator-light mt-0"></div>
																	<form>
																		<div class="form-group">
																			<label class="form-label">Add Comment</label>
																			<textarea class="form-control" rows="5"></textarea>
																			<small class="form-text text-muted">Basic HTML is allowed</small>
																		</div>
																		<div class="d-flex align-items-center justify-content-between">
																			<button class="btn btn-primary">Send</button>
																		</div>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>	
										</div>	
									</div>
									<div class="collapse-simple">
										<div class="card card-border">
											<div class="card-header">
												<a role="button" data-bs-toggle="collapse" href="#gal_collapse_2" aria-expanded="true">
													<h5 class="mb-0">November 20</h5>
												</a>
											</div>
											<div id="gal_collapse_2" class="collapse show">
												<div class="card-body">
													<div class="row gx-3 row-cols-xxl-6 row-cols-xl-5 row-cols-lg-3 row-cols-md-2 row-cols-1 hk-gallery">
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock6.jpg" style="background-image:url('dist/img/gallery/mock6.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock7.jpg" style="background-image:url('dist/img/gallery/mock7.jpg');">
																</div>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock8.jpg" style="background-image:url('dist/img/gallery/mock8.jpg');">
																</div>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock9.jpg" style="background-image:url('dist/img/gallery/mock9.jpg');">
																</div>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock10.jpg" style="background-image:url('dist/img/gallery/mock10.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img gallery-video" data-sub-html="#caption" data-src="https://www.youtube.com/watch?v=BvXR97eR1QE" data-poster="dist/img/gallery/mock2.jpg" data-sub-html="#caption3" style="background-image:url('dist/img/gallery/mock1.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
													</div>
												</div>
											</div>	
										</div>	
									</div>
									<div class="collapse-simple">
										<div class="card card-border">
											<div class="card-header">
												<a role="button" data-bs-toggle="collapse" href="#gal_collapse_3" aria-expanded="true">
													<h5 class="mb-0">October 20</h5>
												</a>
											</div>
											<div id="gal_collapse_3" class="collapse show">
												<div class="card-body">
													<div class="row gx-3 row-cols-xxl-6 row-cols-xl-5 row-cols-lg-3 row-cols-md-2 row-cols-1 hk-gallery">
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock11.jpg" style="background-image:url('dist/img/gallery/mock11.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock12.jpg" style="background-image:url('dist/img/gallery/mock12.jpg');">
																</div>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock13.jpg" style="background-image:url('dist/img/gallery/mock13.jpg');">
																</div>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock14.jpg" style="background-image:url('dist/img/gallery/mock14.jpg');">
																</div>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img" data-sub-html="#caption" data-src="dist/img/gallery/mock15.jpg" style="background-image:url('dist/img/gallery/mock15.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
														<div class="col">
															<a href="#">
																<div class="card card-border gallery-img gallery-video" data-sub-html="#caption" data-src="https://www.youtube.com/watch?v=BvXR97eR1QE" data-poster="dist/img/gallery/mock12.jpg" data-sub-html="#caption3" style="background-image:url('dist/img/gallery/mock12.jpg');">
																</div>
																<span class="gallery-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
															</a>
														</div>
													</div>
												</div>
											</div>	
										</div>	
									</div>
									
								</div>
							</div>
						</div>
						<!-- Add Category -->
						<div id="add_new_cat" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h6 class="text-uppercase fw-bold mb-3">Add Category</h6>
										<form>
											<div class="row gx-3">
												<div class="col-sm-12">
													<div class="form-group">
														<input class="form-control" type="text" placeholder="Category Name"/>
													</div>
												</div>
											</div>
											<button type="button" class="btn btn-primary float-end" data-bs-dismiss="modal">Add</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- /Add Category -->
					</div>
				</div>
			</div>
			<!-- /Page Body -->
		</div>
		<!-- /Main Content -->