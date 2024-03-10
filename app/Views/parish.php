  <!-- Page banner area start here -->
  <section class="banner__inner-page bg-image pt-160 pb-160 bg-image"
            data-background="/themes/frontend/assets/images/banner/banner-inner-page.jpg">
            <div class="container">
                <h2 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">Causes Grid</h2>
                <div class="breadcrumb-list wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                    <a href="index.html">Home</a><span><i class="fa-regular fa-angles-right mx-2"></i>Causes Grid</span>
                </div>
            </div>
        </section>

      
        <!-- Page banner area end here -->

        <!-- Cause area start here -->
        <section class="cause-area pt-120 pb-120">
            <div class="container">
                <div class="row g-4">
                    <?php foreach ($parishList as $key => $parish) {
                       ?>
        <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="cause__item">
                            <div class="cause__image image">
                                <img src="/uploads/parish/<?=$parish['cimg']?>" alt="image">
                              
                            </div>
                            <div class="cause__content">
                                <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover"><?=$parish['company_name']?></a></h4>
                                <div class="progress-area">
                                    <div class="progress__item">
                                        <div class="progress__content" style="width: 70%;"><span>70%</span></div>
                                    </div>
                                    <div class="progress__goal mt-15">
                                        <h6>Goal : <span>$40.000</span></h6>
                                        <h6>Raised : <span>$30.000</span></h6>
                                    </div>
                                    <div class="btn-three mt-30">
                                        <span class="btn-circle">
                                        </span>
                                        <a href="cause-single.html" class="btn-inner">
                                            <span class="btn-text">
                                                DONATE NOW
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   

<?php 
                    }?>
                   
                </div>
                <div class="pegi justify-content-center mt-80">
                    <a href="#0" class="active">01</a>
                    <a href="#0">02</a>
                    <a href="#0">03</a>
                    <a href="#0"><i class="fa-solid fa-arrow-right-long primary-color transition"></i></a>
                </div>
            </div>
        </section>
        <!-- Cause area end here -->