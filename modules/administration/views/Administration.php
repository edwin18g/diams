

<!-- Page banner area start here -->
<section class="banner__inner-page bg-image pt-160 pb-160 bg-image"
            data-background="assets/images/banner/banner-inner-page.jpg">
            <div class="container">
                <h2 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">Volunteer</h2>
                <div class="breadcrumb-list wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                    <a href="index.html">Home</a><span><i class="fa-regular fa-angles-right mx-2"></i>Volunteer</span>
                </div>
            </div>
        </section>
        <!-- Page banner area end here -->

        <!-- Team area start here -->
        <section class="team-area pt-120 pb-120">
            <div class="container">
                <div class="row g-4">
                    
					<?php 	foreach($administration as $key =>$role): ?>
				
					
						<?php foreach($role['user'] as $rkey =>$c): ?>

<div class="col-lg-4 col-sm-6 wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="team__item image">
                            <img src="<?=base_url('uploads/users/thumbs/' . imageCheck('users', getUserPhoto($c['userID']), 1)) ?>" alt="image">
                            <div class="team__content">
                                <div class="social-icon mb-30">
                                    <a href="#0"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a class="active" href="#0"><i class="fa-brands fa-instagram"></i></a>
                                    <a href="#0"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#0"><i class="fa-brands fa-pinterest-p"></i></a>
                                </div>
                                <div class="content">
                                    <h4><a href="team-single.html" class="primary-hover"><?=$c['full_name'] ?></a></h4>
                                    <span><?= $c['a_role'] ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
							
							

						
						<?php endforeach;?>
				
						
					<?php endforeach;?>
                   
                    
                </div>
            </div>
        </section>
       