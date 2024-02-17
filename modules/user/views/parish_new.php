    
    <!-- Wrapper -->
	<div class="hk-wrapper" data-layout="vertical"  data-menu="light" data-footer="simple" data-hover="active">
		<!-- Main Content -->
		
			<!-- Page Body -->
			<div class="hk-pg-body py-0">
				<div class="contactapp-wrap">

					<div class="contactapp-content">
						<div class="contactapp-detail-wrap">
							<header class="contact-header">
								<div class="d-flex align-items-center">									
                                    <div class="contactapp-title " role="button" aria-haspopup="true" aria-expanded="false">
                                        <h1>Parish List</h1>                                       
                                    </div>		
                                    <button type="button" class="btn btn-primary btn-rounded btn-block mb-4" data-bs-toggle="modal" data-bs-target="#add_new_contact">
                                        Add new Parish
                                    </button>
								</div>

								<div class="contact-options-wrap">	
									<a class="btn btn-icon btn-flush-dark flush-soft-hover dropdown-toggle no-caret active" href="#" data-bs-toggle="dropdown"><span class="icon"><span class="feather-icon"><i data-feather="list"></i></span></span></a>
									<div class="dropdown-menu dropdown-menu-end">
										<a class="dropdown-item active" href="contact.html"><span class="feather-icon dropdown-icon"><i data-feather="list"></i></span><span>List View</span></a>
										<a class="dropdown-item" href="contact-cards.html"><span class="feather-icon dropdown-icon"><i data-feather="grid"></i></span><span>Grid View</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="server"></i></span><span>Compact View</span></a>
									</div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover no-caret d-sm-inline-block d-none" href="#" data-bs-toggle="tooltip" data-placement="top" title="" data-bs-original-title="Refresh"><span class="icon"><span class="feather-icon"><i data-feather="refresh-cw"></i></span></span></a>
									<div class="v-separator d-lg-block d-none"></div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret  d-lg-inline-block d-none  ms-sm-0" href="#" data-bs-toggle="dropdown"><span class="icon" data-bs-toggle="tooltip" data-placement="top" title="" data-bs-original-title="Manage Contact"><span class="feather-icon"><i data-feather="settings"></i></span></span></a>
									<div class="dropdown-menu dropdown-menu-end">
										<a class="dropdown-item" href="#">Manage Contact</a>
										<a class="dropdown-item" href="#">Import</a>
										<a class="dropdown-item" href="#">Export</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Send Messages</a>
										<a class="dropdown-item" href="#">Delegate Access</a>
									</div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret d-lg-inline-block d-none" href="#" data-bs-toggle="dropdown"><span class="icon" data-bs-toggle="tooltip" data-placement="top" title="" data-bs-original-title="More"><span class="feather-icon"><i data-feather="more-vertical"></i></span></span></a>
									<div class="dropdown-menu dropdown-menu-end">
										<a class="dropdown-item" href="profile.html"><span class="feather-icon dropdown-icon"><i data-feather="star"></i></span><span>Stared Contacts</span></a>
										<a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="archive"></i></span><span>Archive Contacts</span></a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="email.html"><span class="feather-icon dropdown-icon"><i data-feather="slash"></i></span><span>Block Content</span></a>
										<a class="dropdown-item" href="email.html"><span class="feather-icon dropdown-icon"><i data-feather="external-link"></i></span><span>Feedback</span></a>
									</div>
									<a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover hk-navbar-togglable d-sm-inline-block d-none" href="#" data-bs-toggle="tooltip" data-placement="top" title="" data-bs-original-title="Collapse">
										<span class="icon">
											<span class="feather-icon"><i data-feather="chevron-up"></i></span>
											<span class="feather-icon d-none"><i data-feather="chevron-down"></i></span>
										</span>
									</a>
								</div>								
							</header>
							<div class="contact-body">
								<div data-simplebar class="nicescroll-bar">
									<div class="collapse" id="collapseQuick">
										<div class="quick-access-form-wrap">
											<form class="quick-access-form border">
												<div class="row gx-3">
													<div class="col-xxl-10">
														<div class="position-relative">
															<div class="dropify-square">
																<input type="file"  class="dropify-1"/>
															</div>
															<div class="col-md-12">
																<div class="row gx-3">
																	<div class="col-lg-4">
																		<div class="form-group">
																			<input class="form-control" placeholder="First name*" value="" type="text">
																		</div>
																		<div class="form-group">
																			<input class="form-control" placeholder="Last name*" value="" type="text">
																		</div>
																	</div>
																	<div class="col-lg-4">
																		<div class="form-group">
																			<input class="form-control" placeholder="Email Id*" value="" type="text">
																		</div>
																		<div class="form-group">
																			<input class="form-control" placeholder="Phone" value="" type="text">
																		</div>
																	</div>
																	<div class="col-lg-4">
																		<div class="form-group">
																			<input class="form-control"  placeholder="Department" value="" type="text">
																		</div>
																		<div class="form-group">
																			<select id="input_tags" class="form-control" multiple="multiple">
																				<option selected="selected">Collaborator</option>
																				<option>Designer</option>
																				<option selected="selected">Developer</option>
																			</select>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-xxl-2">
														<div class="form-group">
															<button data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false"  class="btn btn-block btn-primary ">Create New
															</button>
														</div>
														<div class="form-group">
															<button data-bs-toggle="collapse" disabled  data-bs-target="#collapseExample" aria-expanded="false"  class="btn btn-block btn-secondary">Discard
															</button>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class="contact-list-view">
										<table id="datable_1" class="table nowrap w-100 mb-5">
											<thead>
												<tr>
													<th><span class="form-check mb-0">
														<input type="checkbox" class="form-check-input check-select-all" id="customCheck1">
														<label class="form-check-label" for="customCheck1"></label>
													</span></th>
													<th>Church Name</th>
													<th>Established Year</th>
													<th>Substations</th>
													<th>Count of Anbiyam</th>
													<th>Pious</th>
													<th>Institution</th>
													<th>Type</th>
													<th>Address</th>
													<th>History</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
                                            <?php  {?>
                                                <?php foreach ($parish_data as $key => $value) { ?>  
                                                    <tr>
                                                        <td>
                                                            <!-- <div class="d-flex align-items-center">
                                                                <span class="contact-star marked"><span class="feather-icon"><i data-feather="star"></i></span></span>
                                                            </div> -->
                                                        </td>
                                                    
                                                        <td>
                                                            <div class="media align-items-center">
                                                                <div class="media-head me-2">
                                                                    <div class="avatar avatar-xs avatar-rounded">
                                                                        <img src="<?=base_url('uploads/users/thumbs/' . imageCheck('users', getUserPhoto($value['churchid']), 1)) ?>" class="avatar-img" alt="" />                                                                     

                                                                        <!-- <img src="<?php //echo $value['cimg'] ?>" alt="church" class="avatar-img"> -->
                                                                    </div>
                                                                </div>
                                                                <div class="media-body">
                                                                    <span class="d-block text-high-em"><?php echo $value['cname'] ?></span> 
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="text-truncate"><?php echo $value['estd'] ?></td>
                                                        <td><?php echo $value['substation'] ?></td>
                                                        <td><?php echo $value['anbiyam'] ?></td>
                                                        <td><?php echo $value['pious'] ?></td>
                                                        <td><?php echo $value['institution'] ?></td>
                                                        <td><?php echo $value['type'] ?></td>
                                                        <td><?php echo $value['address'] ?></td>
                                                        <td><?php echo $value['chistory'] ?></td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <div class="d-flex">
                                                                    <a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-placement="top" title="" data-bs-original-title="Archive" href="#"><span class="icon"><span class="feather-icon"><i data-feather="archive"></i></span></span></a>
                                                                    <a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover" data-bs-toggle="tooltip" data-placement="top" title="" data-bs-original-title="Edit" href="edit-contact.html"><span class="icon"><span class="feather-icon"><i data-feather="edit"></i></span></span></a>
                                                                    <a class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover del-button" data-bs-toggle="tooltip" data-placement="top" title="" data-bs-original-title="Delete" href="#"><span class="icon"><span class="feather-icon"><i data-feather="trash"></i></span></span></a>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn btn-icon btn-flush-dark btn-rounded flush-soft-hover dropdown-toggle no-caret" aria-expanded="false" data-bs-toggle="dropdown"><span class="icon"><span class="feather-icon"><i data-feather="more-vertical"></i></span></span></button>
                                                                    <div class="dropdown-menu dropdown-menu-end">
                                                                        <a class="dropdown-item" href="edit-contact.html"><span class="feather-icon dropdown-icon"><i data-feather="edit"></i></span><span>Edit Contact</span></a>
                                                                        <a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="trash-2"></i></span><span>Delete</span></a>
                                                                        <a class="dropdown-item" href="#"><span class="feather-icon dropdown-icon"><i data-feather="copy"></i></span><span>Duplicate</span></a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <h6 class="dropdown-header dropdown-header-bold">Change Labels</h6>
                                                                        <a class="dropdown-item" href="#">Design</a>
                                                                        <a class="dropdown-item" href="#">Developer</a>
                                                                        <a class="dropdown-item" href="#">Inventory</a>
                                                                        <a class="dropdown-item" href="#">Human Resource</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php } ?>
                                            <?php } ?>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- Edit Info -->
						<div id="add_new_contact" class="modal fade add-new-contact" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h5 class="mb-5">Create New Parish</h5>
										<form>
											<div class="row gx-3">
												<div class="col-sm-2 form-group">
													<div class="dropify-square">
														<input type="file"  class="dropify-1"/>
													</div>
												</div>
											</div>
											<div class="title title-xs title-wth-divider text-primary text-uppercase my-4"><span>Basic Info</span></div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label class="form-label">Church Name</label>
                                                    <input class="form-control" type="text"/>
                                                </div>
                                            </div>	
                                            
                                            <div class="row gx-3">
											
											    <div class="col-sm-6">
													<div class="form-group">
														<label class="form-label">Established Year</label>
														<input class="form-control" type="text"/>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
														<label class="form-label">substation</label>
														<input class="form-control" type="text"/>
													</div>
												</div>												
											</div>
                                            <div class="row gx-3">
                                                <div class="col-sm-6">
													<div class="form-group">
														<label class="form-label">Count of Anbiyam</label>
														<input class="form-control" type="text"/>
													</div>
												</div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="form-label">Parish Type</label>
                                                        <select class="form-select">
                                                            <option selected="">Select Priest Type</option>
                                                            <option value="1">Parish</option>
                                                            <option value="2">Shrine</option>
                                                        </select>
                                                    </div>
                                                </div>
											</div>
											<div class="col-sm-12">
                                                <div class="form-group">
                                                    <label class="form-label">Institution</label>
                                                    <input class="form-control" type="text"/>
                                                </div>
                                            </div>
                                           
                                            
											<div class="col-sm-12">
                                                <div class="form-group">
                                                    <label class="form-label">Pious</label>
                                                    <textarea class="form-control mnh-100p" rows="3" placeholder=""></textarea>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label class="form-label">Address</label>
                                                    <textarea class="form-control mnh-100p" rows="3" placeholder=""></textarea>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label class="form-label">History</label>
                                                    <textarea class="form-control mnh-100p" rows="3" placeholder=""></textarea>
                                                </div>
                                            </div>


											<!-- <div class="title title-xs title-wth-divider text-primary text-uppercase my-4"><span>Additional Info</span></div>
											
											<div class="row gx-3">
												<div class="col-sm-6">
													<div class="form-group">
                                                        <label class="form-label">Church Facebook</label>
														<input class="form-control" type="text" placeholder="Facebook"/>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
                                                        <label class="form-label">Church Youtube</label>
														<input class="form-control" type="text" placeholder="Youtube"/>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
                                                        <label class="form-label">Church Instagram</label>
														<input class="form-control" type="text" placeholder="Instagram"/>
													</div>
												</div>
												<div class="col-sm-6">
													<div class="form-group">
                                                        <label class="form-label">Church Twitter</label>
														<input class="form-control" type="text" placeholder="Twitter"/>
													</div>
												</div>
											</div> -->
										</form>
									</div>
									<div class="modal-footer align-items-center">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
										<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Create</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /Edit Info -->
						
						<!-- Add Label -->
						<div id="add_new_label" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h6 class="text-uppercase fw-bold mb-3">Add Label</h6>
										<form>
											<div class="row gx-3">
												<div class="col-sm-12">
													<div class="form-group">
														<input class="form-control" type="text" placeholder="Label Name"/>
													</div>
												</div>
											</div>
											<button type="button" class="btn btn-primary float-end" data-bs-dismiss="modal">Add</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- Add Label -->
						
						<!-- Add Tag -->
						<div id="add_new_tag" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-body">
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
										<h6 class="text-uppercase fw-bold mb-3">Add Tag</h6>
										<form>
											<div class="row gx-3">
												<div class="col-sm-12">
													<div class="form-group">
														<select id="input_tags_3" class="form-control" multiple="multiple">
															<option selected="selected">Collaborator</option>
															<option selected="selected">Designer</option>
															<option selected="selected">React Developer</option>
															<option selected="selected">Promotion</option>
															<option selected="selected">Advertisement</option>
														</select>
													</div>
												</div>
											</div>
											<button type="button" class="btn btn-primary float-end" data-bs-dismiss="modal">Add</button>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- Add Tag -->
					</div>
				</div>
			</div>
			<!-- /Page Body -->
		
		<!-- /Main Content -->
	</div>
    <!-- /Wrapper -->
