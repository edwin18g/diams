  <!-- Banner area start here -->
  <section class="banner-two-area">
            <div class="swiper banner-two__slider">
                <div class="swiper-wrapper">
                  <?php foreach($home_slider as $c):?>
                    <div class="swiper-slide">
                    
                        <div class="slide-bg" data-background="<?php echo  base_url('uploads/snapshots/' . imageCheck('snapshots', $c['snapshotFile'], 0)) ?>"></div>
                        <div class="container">
                            <div class="banner-two__content">
                                <!-- <h4 data-animation="fadeInUp" data-delay=".3s">Change The World Together</h4> -->
                                <br>
                                <br>
                                <h1 data-animation="fadeInUp" data-delay=".5s"><?=$c['snapshotContent']?></h1>
                                <div class="btn-one mt-50" data-animation="fadeInUp" data-delay="1s">
                                    <span class="btn-circle">
                                    </span>
                                    <a href="cause-single.html" class="btn-inner">
                                        <span class="btn-text">
                                           VIEW MORE
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                  <?php endforeach;?>
                    
                </div>
            </div>
            <div class="banner-two__arry-btn">
                <button class="arry-prev mb-15 banner-two__arry-prev active"><i
                        class="fa-light fa-chevron-left"></i></button>
                <button class="arry-next banner-two__arry-next"><i class="fa-light fa-chevron-right"></i></button>
            </div>
            <ul class="banner-two__social">
                <li>
                    <a href="#0"><i class="fa-brands fa-facebook-f"></i></a>
                </li>
                <li>
                    <a href="#0" class="active"><i class="fa-brands fa-twitter"></i></a>
                </li>
                <li>
                    <a href="#0"><i class="fa-brands fa-linkedin-in"></i></a>
                </li>
            </ul>
            <div class="banner-two__shape wow slideInLeft" data-wow-delay="600ms" data-wow-duration="1500ms">
                <img class="banner__line__animation" src="/themes/frontend/assets/images/shape/banner-line.png" alt="shape">
            </div>
        </section>
        <!-- Banner area end here -->

        <!-- Service area start here -->
        <!-- <section class="service-area pt-100 pb-100 sub-bg">
            <div class="container">
                <div class="row g-4">
                    <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="service__item">
                            <div class="service__icon"><img src="/themes/frontend/assets/images/icon/service1.png" alt="icon"></div>
                            <div class="service__content">
                                <h3 class="text-white">Kids Education</h3>
                                <p class="text-white">Every is to be welcomed in certain circumstances</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="service__item active">
                            <div class="service__icon"><img src="/themes/frontend/assets/images/icon/service2.png" alt="icon"></div>
                            <div class="service__content">
                                <h3 class="text-white">Healthy Food</h3>
                                <p class="text-white">Every is to be welcomed in certain circumstances</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay="400ms" data-wow-duration="1500ms">
                        <div class="service__item">
                            <div class="service__icon"><img src="/themes/frontend/assets/images/icon/service3.png" alt="icon"></div>
                            <div class="service__content">
                                <h3 class="text-white">Medical Help</h3>
                                <p class="text-white">Every is to be welcomed in certain circumstances</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->
        <!-- Service area end here -->

        <!-- About area start here -->
        <section class="about-area pt-120 pb-120">
            <div class="container">
                <div class="row g-2 align-items-center">
                    <div class="col-lg-6 wow fadeInLeft" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="about__image">
                            <div class="dots about-dot__animation">
                                <img src="/themes/frontend/assets/images/shape/about-dot.png" alt="dots">
                            </div>
                            <div class="sm-image">
                                <img src="/themes/frontend/assets/images/about/about-image2.png" alt="image">
                            </div>
                            <div class="image">
                                <img src="/themes/frontend/assets/images/about/about-image1.jpg" alt="image">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="section-header mb-20">
                            <h5 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                                <i class="fa-regular fa-angles-left pe-1"></i> Bishop <i
                                    class="fa-regular fa-angles-right ps-1"></i>
                            </h5>
                           
                            <h2 class="wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                            The Most Rev. Albert Anastas</h2>
                            <p class="wow fadeInUp" data-wow-delay="400ms" data-wow-duration="1500ms">It is a long
                                established fact that a reader will be distracted the readable content of a
                                page when looking at layout the
                                point of using lorem Ipsum <br>
                                less normal distribution of letters.</p>
                        </div>
                        <div class="about__content">
                            <div class="d-flex align-content-center flex-wrap gap-4 mt-40 wow fadeInDown"
                                data-wow-delay="400ms" data-wow-duration="1500ms">
                                <div class="btn-two">
                                    <span class="btn-circle">
                                    </span>
                                    <a href="about.html" class="btn-inner">
                                        <span class="btn-text">
                                            View More
                                        </span>
                                    </a>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About area end here -->

        <!-- Video area start here -->
        <section class="video-area">
            <div class="row g-0">
                <div class="col-md-5">
                    <div class="video__left-item bg-image h-100"
                        data-background="/themes/frontend/assets/images/video/video-left-image.jpg">
                        <div class="video__btn-wrp">
                            <div class="video-btn video-pulse">
                                <a class="video-popup" href="https://www.youtube.com/watch?v=ElG5-nXD0B8"><i
                                        class="fa-solid fa-play"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="video__right-item bg-image pt-120 pb-120 pl-80"
                        data-background="/themes/frontend/assets/images/video/video-right-image.jpg">
                        <div class="video__content">
                            <div class="section-header mb-40">
                                <h5 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                                    <i class="fa-regular fa-angles-left pe-1"></i> Watch Videos <i
                                        class="fa-regular fa-angles-right ps-1"></i>
                                </h5>
                                <h2 class="text-white wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                                    Bishop Ordination Youtube Video</h2>
                            </div>
                            <div class="d-flex align-items-center justify-content-between gap-4 flex-wrap">
                                <div class="info wow fadeInDown">
                                    <h2 class="text-white"><span class="count text-white">22-02-2024</span></h2>
                                    <p class="mt-10 text-white">Ordination Date</p>
                                </div>
                                <div class="info wow fadeInDown" data-wow-delay="200ms" data-wow-duration="1500ms">
                                    <h2 class="text-white"><span class="count text-white">Monday Market</span></h2>
                                    <p class="mt-10 text-white">Ordination Place</p>
                                </div>
                                <div class="info wow fadeInDown" data-wow-delay="400ms" data-wow-duration="1500ms">
                                    <h2 class="text-white">$<span class="count text-white">125</span>k</h2>
                                    <p class="mt-10 text-white">Raised Now</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Video area end here -->

        <!-- Cause area start here -->
        <section class="cause-area pt-120 pb-100">
            <div class="container">
                <div class="d-flex align-items-center justify-content-between flex-wrap gap-4 mb-40">
                    <div class="section-header">
                        <h5 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <i class="fa-regular fa-angles-left pe-1"></i> ARTICLES <i
                                class="fa-regular fa-angles-right ps-1"></i>
                        </h5>
                        <h2 class="wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">Latest Articles</h2>
                           
                    </div>
                    <div class="arry-btn wow fadeInUp" data-wow-delay="400ms" data-wow-duration="1500ms">
                        <button class="arry-prev cause__arry-prev"><i class="fa-regular fa-chevron-left"></i></button>
                        <button class="arry-next cause__arry-next active ml-10"><i
                                class="fa-regular fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
            <div class="cause__slider-wrp">
                <div class="swiper cause__slider">
                    <div class="swiper-wrapper py-4">
                        <div class="swiper-slide">
                            <div class="cause__item">
                                <div class="cause__image image">
                                    <img src="/themes/frontend/assets/images/cause/cause-image1.jpg" alt="image">
                                    <span class="cause-tag">Education</span>
                                </div>
                                <div class="cause__content">
                                    <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover">Rebecca's
                                            New Album
                                            Aid
                                            for
                                            the
                                            Needy</a></h4>
                                    <div class="progress-area">
                                        <div class="progress__item">
                                            <div class="progress__content" style="width: 50%;"><span>50%</span></div>
                                        </div>
                                        <div class="progress__goal mt-15">
                                            <h6>Goal : <span>$40.000</span></h6>
                                            <h6>Raised : <span>$20.000</span></h6>
                                        </div>
                                        <div class="btn-three mt-30">
                                            <span class="btn-circle">
                                            </span>
                                            <a href="cause-single.html" class="btn-inner">
                                                <span class="btn-text">
                                                    View More
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="cause__item">
                                <div class="cause__image image">
                                    <img src="/themes/frontend/assets/images/cause/cause-image2.jpg" alt="image">
                                    <span class="cause-tag">Foods</span>
                                </div>
                                <div class="cause__content">
                                    <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover">Charity
                                            Showcases a
                                            Nation's Kindness</a></h4>
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
                                                   View More
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="cause__item">
                                <div class="cause__image image">
                                    <img src="/themes/frontend/assets/images/cause/cause-image3.jpg" alt="image">
                                    <span class="cause-tag">Medical</span>
                                </div>
                                <div class="cause__content">
                                    <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover">Construct
                                            Dwellings
                                            African Impoverished Women
                                        </a></h4>
                                    <div class="progress-area">
                                        <div class="progress__item">
                                            <div class="progress__content" style="width: 90%;"><span>90%</span></div>
                                        </div>
                                        <div class="progress__goal mt-15">
                                            <h6>Goal : <span>$40.000</span></h6>
                                            <h6>Raised : <span>$35.000</span></h6>
                                        </div>
                                        <div class="btn-three mt-30">
                                            <span class="btn-circle">
                                            </span>
                                            <a href="cause-single.html" class="btn-inner">
                                                <span class="btn-text">
                                                   View More
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="cause__item">
                                <div class="cause__image image">
                                    <img src="/themes/frontend/assets/images/cause/cause-image4.jpg" alt="image">
                                    <span class="cause-tag">Water</span>
                                </div>
                                <div class="cause__content">
                                    <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover">Provide
                                            Healthy
                                            Meals to
                                            an Impoverished Rural Child</a></h4>
                                    <div class="progress-area">
                                        <div class="progress__item">
                                            <div class="progress__content" style="width: 65%;"><span>65%</span></div>
                                        </div>
                                        <div class="progress__goal mt-15">
                                            <h6>Goal : <span>$40.000</span></h6>
                                            <h6>Raised : <span>$25.000</span></h6>
                                        </div>
                                        <div class="btn-three mt-30">
                                            <span class="btn-circle">
                                            </span>
                                            <a href="cause-single.html" class="btn-inner">
                                                <span class="btn-text">
                                                   View More
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="cause__item">
                                <div class="cause__image image">
                                    <img src="/themes/frontend/assets/images/cause/cause-image1.jpg" alt="image">
                                    <span class="cause-tag">Education</span>
                                </div>
                                <div class="cause__content">
                                    <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover">Rebecca's
                                            New Album
                                            Aid
                                            for
                                            the
                                            Needy</a></h4>
                                    <div class="progress-area">
                                        <div class="progress__item">
                                            <div class="progress__content" style="width: 50%;"><span>50%</span></div>
                                        </div>
                                        <div class="progress__goal mt-15">
                                            <h6>Goal : <span>$40.000</span></h6>
                                            <h6>Raised : <span>$20.000</span></h6>
                                        </div>
                                        <div class="btn-three mt-30">
                                            <span class="btn-circle">
                                            </span>
                                            <a href="cause-single.html" class="btn-inner">
                                                <span class="btn-text">
                                                   View More
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="cause__item">
                                <div class="cause__image image">
                                    <img src="/themes/frontend/assets/images/cause/cause-image2.jpg" alt="image">
                                    <span class="cause-tag">Foods</span>
                                </div>
                                <div class="cause__content">
                                    <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover">Charity
                                            Showcases a
                                            Nation's Kindness</a></h4>
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
                                                   View More
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="cause__item">
                                <div class="cause__image image">
                                    <img src="/themes/frontend/assets/images/cause/cause-image3.jpg" alt="image">
                                    <span class="cause-tag">Medical</span>
                                </div>
                                <div class="cause__content">
                                    <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover">Construct
                                            Dwellings
                                            African Impoverished Women
                                        </a></h4>
                                    <div class="progress-area">
                                        <div class="progress__item">
                                            <div class="progress__content" style="width: 90%;"><span>90%</span></div>
                                        </div>
                                        <div class="progress__goal mt-15">
                                            <h6>Goal : <span>$40.000</span></h6>
                                            <h6>Raised : <span>$35.000</span></h6>
                                        </div>
                                        <div class="btn-three mt-30">
                                            <span class="btn-circle">
                                            </span>
                                            <a href="cause-single.html" class="btn-inner">
                                                <span class="btn-text">
                                                   View More
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="cause__item">
                                <div class="cause__image image">
                                    <img src="/themes/frontend/assets/images/cause/cause-image4.jpg" alt="image">
                                    <span class="cause-tag">Water</span>
                                </div>
                                <div class="cause__content">
                                    <h4 class="mb-4 mt-20"><a href="cause-single.html" class="primary-hover">Provide
                                            Healthy
                                            Meals to
                                            an Impoverished Rural Child</a></h4>
                                    <div class="progress-area">
                                        <div class="progress__item">
                                            <div class="progress__content" style="width: 65%;"><span>65%</span></div>
                                        </div>
                                        <div class="progress__goal mt-15">
                                            <h6>Goal : <span>$40.000</span></h6>
                                            <h6>Raised : <span>$25.000</span></h6>
                                        </div>
                                        <div class="btn-three mt-30">
                                            <span class="btn-circle">
                                            </span>
                                            <a href="cause-single.html" class="btn-inner">
                                                <span class="btn-text">
                                                   View More
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Cause area end here -->

        <!-- Team area start here -->
        <!-- <section class="team-area pt-120 pb-120 sub-bg">
            <div class="container">
                <div class="section-header mb-60 text-center">
                    <h5 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <i class="fa-regular fa-angles-left pe-1"></i> Our Priests <i
                            class="fa-regular fa-angles-right ps-1"></i>
                    </h5>
                    <h2 class="wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">Our Diocese Priests</h2>
                      
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-sm-6 wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="team__item image">
                            <img src="/themes/frontend/assets/images/team/team-image1.jpg" alt="image">
                            <div class="team__content">
                                <div class="social-icon mb-30">
                                    <a href="#0"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a class="active" href="#0"><i class="fa-brands fa-instagram"></i></a>
                                    <a href="#0"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#0"><i class="fa-brands fa-pinterest-p"></i></a>
                                </div>
                                <div class="content">
                                    <h4><a href="team-single.html" class="primary-hover">Kristin Watson</a></h4>
                                    <span>Volunteer</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="team__item image">
                            <img src="/themes/frontend/assets/images/team/team-image2.jpg" alt="image">
                            <div class="team__content">
                                <div class="social-icon mb-30">
                                    <a href="#0"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a class="active" href="#0"><i class="fa-brands fa-instagram"></i></a>
                                    <a href="#0"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#0"><i class="fa-brands fa-pinterest-p"></i></a>
                                </div>
                                <div class="content">
                                    <h4><a href="team-single.html" class="primary-hover">Ralph Edwards</a></h4>
                                    <span>Volunteer</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 wow fadeInUp" data-wow-delay="400ms" data-wow-duration="1500ms">
                        <div class="team__item image">
                            <img src="/themes/frontend/assets/images/team/team-image3.jpg" alt="image">
                            <div class="team__content">
                                <div class="social-icon mb-30">
                                    <a href="#0"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a class="active" href="#0"><i class="fa-brands fa-instagram"></i></a>
                                    <a href="#0"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#0"><i class="fa-brands fa-pinterest-p"></i></a>
                                </div>
                                <div class="content">
                                    <h4><a href="team-single.html" class="primary-hover">Leslie Alexander</a></h4>
                                    <span>Volunteer</span>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </div>
                
                <div class="btn-three mt-30">
                    <span class="btn-circle">
                    </span>
                    <a href="cause-single.html" class="btn-inner">
                        <span class="btn-text">
                            View More
                        </span>
                    </a>
                </div>
            </div>
        </section> -->
        <!-- Team area end here -->

                <!-- Blog area start here -->
        <section class="blog-area pt-60 pb-60  sub-bg">
            <div class="container">
                <div class="section-header mb-60 text-center">
                    <h5 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <i class="fa-regular fa-angles-left pe-1"></i> Our Parish <i class="fa-regular fa-angles-right ps-1"></i>
                    </h5>
                    <h2 class="wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">Our Diocesan Parish</h2>
                </div>
                <div class="row g-4">
                    <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="blog__item">
                            <div class="image">
                                <img src="/themes/frontend/assets/images/blog/blog-image1.jpg" alt="image">
                                <span class="blog-tag">Education</span>
                            </div>
                            <div class="blog__content pt-4">
                                <ul>
                                    <li>
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M14.5435 5.19275C14.5435 7.69093 12.4989 9.7355 10.0008 9.7355C7.50262 9.7355 5.45804 7.69093 5.45804 5.19275C5.45804 2.69457 7.50258 0.65 10.0008 0.65C12.4989 0.65 14.5435 2.69458 14.5435 5.19275Z"
                                                stroke="#F74F22" stroke-width="1.3" />
                                            <path
                                                d="M18.2644 14.6706C18.1052 14.9458 17.9241 15.2073 17.7169 15.4766L17.7168 15.4765L17.7089 15.4873C17.4203 15.8788 17.0845 16.2373 16.7294 16.5924C16.4326 16.8892 16.0932 17.186 15.7567 17.4385C14.0794 18.6911 12.0621 19.3499 9.97814 19.3499C7.89836 19.3499 5.88506 18.6938 4.20976 17.4461C3.84588 17.1504 3.51367 16.8792 3.22686 16.5924L3.2199 16.5854L3.21272 16.5787C2.85663 16.2436 2.54238 15.8877 2.24745 15.4874L2.24747 15.4873L2.24414 15.4829C2.06192 15.24 1.8732 14.9756 1.71919 14.7169C1.83618 14.4559 1.98455 14.1847 2.14521 13.9526L2.14533 13.9527L2.15284 13.9413C3.06984 12.5556 4.53705 11.6388 6.16642 11.4148L6.186 11.4121L6.20538 11.4082C6.23087 11.4031 6.29494 11.4117 6.34548 11.4496L6.34546 11.4496L6.34947 11.4525C7.41651 12.2401 8.68629 12.6453 10.0008 12.6453C11.3153 12.6453 12.5851 12.2401 13.6521 11.4525L13.6521 11.4525L13.6561 11.4496C13.6715 11.438 13.7403 11.408 13.8492 11.4167C15.4688 11.6435 16.9121 12.5568 17.8524 13.9468L17.8524 13.9469L17.8564 13.9526C18.0165 14.1839 18.1557 14.4231 18.2644 14.6706Z"
                                                stroke="#F74F22" stroke-width="1.3" />
                                        </svg>
                                        <a href="blog-single.html"><span class="primary-hover transition">By
                                                Admin</span></a>
                                    </li>
                                    <li>
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.66667 4.7915C6.325 4.7915 6.04167 4.50817 6.04167 4.1665V1.6665C6.04167 1.32484 6.325 1.0415 6.66667 1.0415C7.00833 1.0415 7.29167 1.32484 7.29167 1.6665V4.1665C7.29167 4.50817 7.00833 4.7915 6.66667 4.7915ZM13.3333 4.7915C12.9917 4.7915 12.7083 4.50817 12.7083 4.1665V1.6665C12.7083 1.32484 12.9917 1.0415 13.3333 1.0415C13.675 1.0415 13.9583 1.32484 13.9583 1.6665V4.1665C13.9583 4.50817 13.675 4.7915 13.3333 4.7915ZM7.08333 12.0832C6.975 12.0832 6.86667 12.0582 6.76667 12.0165C6.65833 11.9748 6.575 11.9165 6.49167 11.8415C6.34167 11.6832 6.25 11.4748 6.25 11.2498C6.25 11.1415 6.275 11.0332 6.31667 10.9332C6.35833 10.8332 6.41667 10.7415 6.49167 10.6582C6.575 10.5832 6.65833 10.5248 6.76667 10.4832C7.06667 10.3582 7.44167 10.4248 7.675 10.6582C7.825 10.8165 7.91667 11.0332 7.91667 11.2498C7.91667 11.2998 7.90833 11.3582 7.9 11.4165C7.89167 11.4665 7.875 11.5165 7.85 11.5665C7.83333 11.6165 7.80833 11.6665 7.775 11.7165C7.75 11.7582 7.70833 11.7998 7.675 11.8415C7.51667 11.9915 7.3 12.0832 7.08333 12.0832ZM10 12.0832C9.89167 12.0832 9.78333 12.0582 9.68333 12.0165C9.575 11.9748 9.49167 11.9165 9.40833 11.8415C9.25833 11.6832 9.16667 11.4748 9.16667 11.2498C9.16667 11.1415 9.19167 11.0332 9.23333 10.9332C9.275 10.8332 9.33333 10.7415 9.40833 10.6582C9.49167 10.5832 9.575 10.5248 9.68333 10.4832C9.98333 10.3498 10.3583 10.4248 10.5917 10.6582C10.7417 10.8165 10.8333 11.0332 10.8333 11.2498C10.8333 11.2998 10.825 11.3582 10.8167 11.4165C10.8083 11.4665 10.7917 11.5165 10.7667 11.5665C10.75 11.6165 10.725 11.6665 10.6917 11.7165C10.6667 11.7582 10.625 11.7998 10.5917 11.8415C10.4333 11.9915 10.2167 12.0832 10 12.0832ZM12.9167 12.0832C12.8083 12.0832 12.7 12.0582 12.6 12.0165C12.4917 11.9748 12.4083 11.9165 12.325 11.8415L12.225 11.7165C12.1934 11.6701 12.1682 11.6196 12.15 11.5665C12.1259 11.5193 12.1091 11.4687 12.1 11.4165C12.0917 11.3582 12.0833 11.2998 12.0833 11.2498C12.0833 11.0332 12.175 10.8165 12.325 10.6582C12.4083 10.5832 12.4917 10.5248 12.6 10.4832C12.9083 10.3498 13.275 10.4248 13.5083 10.6582C13.6583 10.8165 13.75 11.0332 13.75 11.2498C13.75 11.2998 13.7417 11.3582 13.7333 11.4165C13.725 11.4665 13.7083 11.5165 13.6833 11.5665C13.6667 11.6165 13.6417 11.6665 13.6083 11.7165C13.5833 11.7582 13.5417 11.7998 13.5083 11.8415C13.35 11.9915 13.1333 12.0832 12.9167 12.0832ZM7.08333 14.9998C6.975 14.9998 6.86667 14.9748 6.76667 14.9332C6.66667 14.8915 6.575 14.8332 6.49167 14.7582C6.34167 14.5998 6.25 14.3832 6.25 14.1665C6.25 14.0582 6.275 13.9498 6.31667 13.8498C6.35833 13.7415 6.41667 13.6498 6.49167 13.5748C6.8 13.2665 7.36667 13.2665 7.675 13.5748C7.825 13.7332 7.91667 13.9498 7.91667 14.1665C7.91667 14.3832 7.825 14.5998 7.675 14.7582C7.51667 14.9082 7.3 14.9998 7.08333 14.9998ZM10 14.9998C9.78333 14.9998 9.56667 14.9082 9.40833 14.7582C9.25833 14.5998 9.16667 14.3832 9.16667 14.1665C9.16667 14.0582 9.19167 13.9498 9.23333 13.8498C9.275 13.7415 9.33333 13.6498 9.40833 13.5748C9.71667 13.2665 10.2833 13.2665 10.5917 13.5748C10.6667 13.6498 10.725 13.7415 10.7667 13.8498C10.8083 13.9498 10.8333 14.0582 10.8333 14.1665C10.8333 14.3832 10.7417 14.5998 10.5917 14.7582C10.4333 14.9082 10.2167 14.9998 10 14.9998ZM12.9167 14.9998C12.7 14.9998 12.4833 14.9082 12.325 14.7582C12.2479 14.6799 12.1882 14.5862 12.15 14.4832C12.1083 14.3832 12.0833 14.2748 12.0833 14.1665C12.0833 14.0582 12.1083 13.9498 12.15 13.8498C12.1917 13.7415 12.25 13.6498 12.325 13.5748C12.5167 13.3832 12.8083 13.2915 13.075 13.3498C13.1333 13.3582 13.1833 13.3748 13.2333 13.3998C13.2833 13.4165 13.3333 13.4415 13.3833 13.4748C13.425 13.4998 13.4667 13.5415 13.5083 13.5748C13.6583 13.7332 13.75 13.9498 13.75 14.1665C13.75 14.3832 13.6583 14.5998 13.5083 14.7582C13.35 14.9082 13.1333 14.9998 12.9167 14.9998ZM17.0833 8.19984H2.91667C2.575 8.19984 2.29167 7.9165 2.29167 7.57484C2.29167 7.23317 2.575 6.94984 2.91667 6.94984H17.0833C17.425 6.94984 17.7083 7.23317 17.7083 7.57484C17.7083 7.9165 17.425 8.19984 17.0833 8.19984Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M13.3333 18.9582H6.66667C3.625 18.9582 1.875 17.2082 1.875 14.1665V7.08317C1.875 4.0415 3.625 2.2915 6.66667 2.2915H13.3333C16.375 2.2915 18.125 4.0415 18.125 7.08317V14.1665C18.125 17.2082 16.375 18.9582 13.3333 18.9582ZM6.66667 3.5415C4.28333 3.5415 3.125 4.69984 3.125 7.08317V14.1665C3.125 16.5498 4.28333 17.7082 6.66667 17.7082H13.3333C15.7167 17.7082 16.875 16.5498 16.875 14.1665V7.08317C16.875 4.69984 15.7167 3.5415 13.3333 3.5415H6.66667Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>22, Nov 2023</span>
                                    </li>
                                </ul>
                                <h4 class="mt-20 pb-25 bor-bottom"><a href="blog-single.html"
                                        class="primary-hover">Rebecca's
                                        New
                                        Album
                                        Aid
                                        for the Needy</a></h4>
                                <a class="mt-4" href="blog-single.html"><span class="read-more fw-bold transition">Read
                                        More <i class="fa-solid fa-arrow-right ms-1"></i></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="blog__item">
                            <div class="image">
                                <img src="/themes/frontend/assets/images/blog/blog-image2.jpg" alt="image">
                                <span class="blog-tag">Foods</span>
                            </div>
                            <div class="blog__content pt-4">
                                <ul>
                                    <li>
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M14.5435 5.19275C14.5435 7.69093 12.4989 9.7355 10.0008 9.7355C7.50262 9.7355 5.45804 7.69093 5.45804 5.19275C5.45804 2.69457 7.50258 0.65 10.0008 0.65C12.4989 0.65 14.5435 2.69458 14.5435 5.19275Z"
                                                stroke="#F74F22" stroke-width="1.3" />
                                            <path
                                                d="M18.2644 14.6706C18.1052 14.9458 17.9241 15.2073 17.7169 15.4766L17.7168 15.4765L17.7089 15.4873C17.4203 15.8788 17.0845 16.2373 16.7294 16.5924C16.4326 16.8892 16.0932 17.186 15.7567 17.4385C14.0794 18.6911 12.0621 19.3499 9.97814 19.3499C7.89836 19.3499 5.88506 18.6938 4.20976 17.4461C3.84588 17.1504 3.51367 16.8792 3.22686 16.5924L3.2199 16.5854L3.21272 16.5787C2.85663 16.2436 2.54238 15.8877 2.24745 15.4874L2.24747 15.4873L2.24414 15.4829C2.06192 15.24 1.8732 14.9756 1.71919 14.7169C1.83618 14.4559 1.98455 14.1847 2.14521 13.9526L2.14533 13.9527L2.15284 13.9413C3.06984 12.5556 4.53705 11.6388 6.16642 11.4148L6.186 11.4121L6.20538 11.4082C6.23087 11.4031 6.29494 11.4117 6.34548 11.4496L6.34546 11.4496L6.34947 11.4525C7.41651 12.2401 8.68629 12.6453 10.0008 12.6453C11.3153 12.6453 12.5851 12.2401 13.6521 11.4525L13.6521 11.4525L13.6561 11.4496C13.6715 11.438 13.7403 11.408 13.8492 11.4167C15.4688 11.6435 16.9121 12.5568 17.8524 13.9468L17.8524 13.9469L17.8564 13.9526C18.0165 14.1839 18.1557 14.4231 18.2644 14.6706Z"
                                                stroke="#F74F22" stroke-width="1.3" />
                                        </svg>
                                        <a href="blog-single.html"><span class="primary-hover transition">By
                                                Admin</span></a>
                                    </li>
                                    <li>
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.66667 4.7915C6.325 4.7915 6.04167 4.50817 6.04167 4.1665V1.6665C6.04167 1.32484 6.325 1.0415 6.66667 1.0415C7.00833 1.0415 7.29167 1.32484 7.29167 1.6665V4.1665C7.29167 4.50817 7.00833 4.7915 6.66667 4.7915ZM13.3333 4.7915C12.9917 4.7915 12.7083 4.50817 12.7083 4.1665V1.6665C12.7083 1.32484 12.9917 1.0415 13.3333 1.0415C13.675 1.0415 13.9583 1.32484 13.9583 1.6665V4.1665C13.9583 4.50817 13.675 4.7915 13.3333 4.7915ZM7.08333 12.0832C6.975 12.0832 6.86667 12.0582 6.76667 12.0165C6.65833 11.9748 6.575 11.9165 6.49167 11.8415C6.34167 11.6832 6.25 11.4748 6.25 11.2498C6.25 11.1415 6.275 11.0332 6.31667 10.9332C6.35833 10.8332 6.41667 10.7415 6.49167 10.6582C6.575 10.5832 6.65833 10.5248 6.76667 10.4832C7.06667 10.3582 7.44167 10.4248 7.675 10.6582C7.825 10.8165 7.91667 11.0332 7.91667 11.2498C7.91667 11.2998 7.90833 11.3582 7.9 11.4165C7.89167 11.4665 7.875 11.5165 7.85 11.5665C7.83333 11.6165 7.80833 11.6665 7.775 11.7165C7.75 11.7582 7.70833 11.7998 7.675 11.8415C7.51667 11.9915 7.3 12.0832 7.08333 12.0832ZM10 12.0832C9.89167 12.0832 9.78333 12.0582 9.68333 12.0165C9.575 11.9748 9.49167 11.9165 9.40833 11.8415C9.25833 11.6832 9.16667 11.4748 9.16667 11.2498C9.16667 11.1415 9.19167 11.0332 9.23333 10.9332C9.275 10.8332 9.33333 10.7415 9.40833 10.6582C9.49167 10.5832 9.575 10.5248 9.68333 10.4832C9.98333 10.3498 10.3583 10.4248 10.5917 10.6582C10.7417 10.8165 10.8333 11.0332 10.8333 11.2498C10.8333 11.2998 10.825 11.3582 10.8167 11.4165C10.8083 11.4665 10.7917 11.5165 10.7667 11.5665C10.75 11.6165 10.725 11.6665 10.6917 11.7165C10.6667 11.7582 10.625 11.7998 10.5917 11.8415C10.4333 11.9915 10.2167 12.0832 10 12.0832ZM12.9167 12.0832C12.8083 12.0832 12.7 12.0582 12.6 12.0165C12.4917 11.9748 12.4083 11.9165 12.325 11.8415L12.225 11.7165C12.1934 11.6701 12.1682 11.6196 12.15 11.5665C12.1259 11.5193 12.1091 11.4687 12.1 11.4165C12.0917 11.3582 12.0833 11.2998 12.0833 11.2498C12.0833 11.0332 12.175 10.8165 12.325 10.6582C12.4083 10.5832 12.4917 10.5248 12.6 10.4832C12.9083 10.3498 13.275 10.4248 13.5083 10.6582C13.6583 10.8165 13.75 11.0332 13.75 11.2498C13.75 11.2998 13.7417 11.3582 13.7333 11.4165C13.725 11.4665 13.7083 11.5165 13.6833 11.5665C13.6667 11.6165 13.6417 11.6665 13.6083 11.7165C13.5833 11.7582 13.5417 11.7998 13.5083 11.8415C13.35 11.9915 13.1333 12.0832 12.9167 12.0832ZM7.08333 14.9998C6.975 14.9998 6.86667 14.9748 6.76667 14.9332C6.66667 14.8915 6.575 14.8332 6.49167 14.7582C6.34167 14.5998 6.25 14.3832 6.25 14.1665C6.25 14.0582 6.275 13.9498 6.31667 13.8498C6.35833 13.7415 6.41667 13.6498 6.49167 13.5748C6.8 13.2665 7.36667 13.2665 7.675 13.5748C7.825 13.7332 7.91667 13.9498 7.91667 14.1665C7.91667 14.3832 7.825 14.5998 7.675 14.7582C7.51667 14.9082 7.3 14.9998 7.08333 14.9998ZM10 14.9998C9.78333 14.9998 9.56667 14.9082 9.40833 14.7582C9.25833 14.5998 9.16667 14.3832 9.16667 14.1665C9.16667 14.0582 9.19167 13.9498 9.23333 13.8498C9.275 13.7415 9.33333 13.6498 9.40833 13.5748C9.71667 13.2665 10.2833 13.2665 10.5917 13.5748C10.6667 13.6498 10.725 13.7415 10.7667 13.8498C10.8083 13.9498 10.8333 14.0582 10.8333 14.1665C10.8333 14.3832 10.7417 14.5998 10.5917 14.7582C10.4333 14.9082 10.2167 14.9998 10 14.9998ZM12.9167 14.9998C12.7 14.9998 12.4833 14.9082 12.325 14.7582C12.2479 14.6799 12.1882 14.5862 12.15 14.4832C12.1083 14.3832 12.0833 14.2748 12.0833 14.1665C12.0833 14.0582 12.1083 13.9498 12.15 13.8498C12.1917 13.7415 12.25 13.6498 12.325 13.5748C12.5167 13.3832 12.8083 13.2915 13.075 13.3498C13.1333 13.3582 13.1833 13.3748 13.2333 13.3998C13.2833 13.4165 13.3333 13.4415 13.3833 13.4748C13.425 13.4998 13.4667 13.5415 13.5083 13.5748C13.6583 13.7332 13.75 13.9498 13.75 14.1665C13.75 14.3832 13.6583 14.5998 13.5083 14.7582C13.35 14.9082 13.1333 14.9998 12.9167 14.9998ZM17.0833 8.19984H2.91667C2.575 8.19984 2.29167 7.9165 2.29167 7.57484C2.29167 7.23317 2.575 6.94984 2.91667 6.94984H17.0833C17.425 6.94984 17.7083 7.23317 17.7083 7.57484C17.7083 7.9165 17.425 8.19984 17.0833 8.19984Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M13.3333 18.9582H6.66667C3.625 18.9582 1.875 17.2082 1.875 14.1665V7.08317C1.875 4.0415 3.625 2.2915 6.66667 2.2915H13.3333C16.375 2.2915 18.125 4.0415 18.125 7.08317V14.1665C18.125 17.2082 16.375 18.9582 13.3333 18.9582ZM6.66667 3.5415C4.28333 3.5415 3.125 4.69984 3.125 7.08317V14.1665C3.125 16.5498 4.28333 17.7082 6.66667 17.7082H13.3333C15.7167 17.7082 16.875 16.5498 16.875 14.1665V7.08317C16.875 4.69984 15.7167 3.5415 13.3333 3.5415H6.66667Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>22, Nov 2023</span>
                                    </li>
                                </ul>
                                <h4 class="mt-20 pb-25 bor-bottom"><a href="blog-single.html"
                                        class="primary-hover">Provide
                                        Healthy
                                        Meals to an Impoverished</a></h4>
                                <a class="mt-4" href="blog-single.html"><span class="read-more fw-bold transition">Read
                                        More <i class="fa-solid fa-arrow-right ms-1"></i></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 wow fadeInUp" data-wow-delay="400ms" data-wow-duration="1500ms">
                        <div class="blog__item">
                            <div class="image">
                                <img src="/themes/frontend/assets/images/blog/blog-image3.jpg" alt="image">
                                <span class="blog-tag">Medical</span>
                            </div>
                            <div class="blog__content pt-4">
                                <ul>
                                    <li>
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M14.5435 5.19275C14.5435 7.69093 12.4989 9.7355 10.0008 9.7355C7.50262 9.7355 5.45804 7.69093 5.45804 5.19275C5.45804 2.69457 7.50258 0.65 10.0008 0.65C12.4989 0.65 14.5435 2.69458 14.5435 5.19275Z"
                                                stroke="#F74F22" stroke-width="1.3" />
                                            <path
                                                d="M18.2644 14.6706C18.1052 14.9458 17.9241 15.2073 17.7169 15.4766L17.7168 15.4765L17.7089 15.4873C17.4203 15.8788 17.0845 16.2373 16.7294 16.5924C16.4326 16.8892 16.0932 17.186 15.7567 17.4385C14.0794 18.6911 12.0621 19.3499 9.97814 19.3499C7.89836 19.3499 5.88506 18.6938 4.20976 17.4461C3.84588 17.1504 3.51367 16.8792 3.22686 16.5924L3.2199 16.5854L3.21272 16.5787C2.85663 16.2436 2.54238 15.8877 2.24745 15.4874L2.24747 15.4873L2.24414 15.4829C2.06192 15.24 1.8732 14.9756 1.71919 14.7169C1.83618 14.4559 1.98455 14.1847 2.14521 13.9526L2.14533 13.9527L2.15284 13.9413C3.06984 12.5556 4.53705 11.6388 6.16642 11.4148L6.186 11.4121L6.20538 11.4082C6.23087 11.4031 6.29494 11.4117 6.34548 11.4496L6.34546 11.4496L6.34947 11.4525C7.41651 12.2401 8.68629 12.6453 10.0008 12.6453C11.3153 12.6453 12.5851 12.2401 13.6521 11.4525L13.6521 11.4525L13.6561 11.4496C13.6715 11.438 13.7403 11.408 13.8492 11.4167C15.4688 11.6435 16.9121 12.5568 17.8524 13.9468L17.8524 13.9469L17.8564 13.9526C18.0165 14.1839 18.1557 14.4231 18.2644 14.6706Z"
                                                stroke="#F74F22" stroke-width="1.3" />
                                        </svg>
                                        <a href="blog-single.html"><span class="primary-hover transition">By
                                                Admin</span></a>
                                    </li>
                                    <li>
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M6.66667 4.7915C6.325 4.7915 6.04167 4.50817 6.04167 4.1665V1.6665C6.04167 1.32484 6.325 1.0415 6.66667 1.0415C7.00833 1.0415 7.29167 1.32484 7.29167 1.6665V4.1665C7.29167 4.50817 7.00833 4.7915 6.66667 4.7915ZM13.3333 4.7915C12.9917 4.7915 12.7083 4.50817 12.7083 4.1665V1.6665C12.7083 1.32484 12.9917 1.0415 13.3333 1.0415C13.675 1.0415 13.9583 1.32484 13.9583 1.6665V4.1665C13.9583 4.50817 13.675 4.7915 13.3333 4.7915ZM7.08333 12.0832C6.975 12.0832 6.86667 12.0582 6.76667 12.0165C6.65833 11.9748 6.575 11.9165 6.49167 11.8415C6.34167 11.6832 6.25 11.4748 6.25 11.2498C6.25 11.1415 6.275 11.0332 6.31667 10.9332C6.35833 10.8332 6.41667 10.7415 6.49167 10.6582C6.575 10.5832 6.65833 10.5248 6.76667 10.4832C7.06667 10.3582 7.44167 10.4248 7.675 10.6582C7.825 10.8165 7.91667 11.0332 7.91667 11.2498C7.91667 11.2998 7.90833 11.3582 7.9 11.4165C7.89167 11.4665 7.875 11.5165 7.85 11.5665C7.83333 11.6165 7.80833 11.6665 7.775 11.7165C7.75 11.7582 7.70833 11.7998 7.675 11.8415C7.51667 11.9915 7.3 12.0832 7.08333 12.0832ZM10 12.0832C9.89167 12.0832 9.78333 12.0582 9.68333 12.0165C9.575 11.9748 9.49167 11.9165 9.40833 11.8415C9.25833 11.6832 9.16667 11.4748 9.16667 11.2498C9.16667 11.1415 9.19167 11.0332 9.23333 10.9332C9.275 10.8332 9.33333 10.7415 9.40833 10.6582C9.49167 10.5832 9.575 10.5248 9.68333 10.4832C9.98333 10.3498 10.3583 10.4248 10.5917 10.6582C10.7417 10.8165 10.8333 11.0332 10.8333 11.2498C10.8333 11.2998 10.825 11.3582 10.8167 11.4165C10.8083 11.4665 10.7917 11.5165 10.7667 11.5665C10.75 11.6165 10.725 11.6665 10.6917 11.7165C10.6667 11.7582 10.625 11.7998 10.5917 11.8415C10.4333 11.9915 10.2167 12.0832 10 12.0832ZM12.9167 12.0832C12.8083 12.0832 12.7 12.0582 12.6 12.0165C12.4917 11.9748 12.4083 11.9165 12.325 11.8415L12.225 11.7165C12.1934 11.6701 12.1682 11.6196 12.15 11.5665C12.1259 11.5193 12.1091 11.4687 12.1 11.4165C12.0917 11.3582 12.0833 11.2998 12.0833 11.2498C12.0833 11.0332 12.175 10.8165 12.325 10.6582C12.4083 10.5832 12.4917 10.5248 12.6 10.4832C12.9083 10.3498 13.275 10.4248 13.5083 10.6582C13.6583 10.8165 13.75 11.0332 13.75 11.2498C13.75 11.2998 13.7417 11.3582 13.7333 11.4165C13.725 11.4665 13.7083 11.5165 13.6833 11.5665C13.6667 11.6165 13.6417 11.6665 13.6083 11.7165C13.5833 11.7582 13.5417 11.7998 13.5083 11.8415C13.35 11.9915 13.1333 12.0832 12.9167 12.0832ZM7.08333 14.9998C6.975 14.9998 6.86667 14.9748 6.76667 14.9332C6.66667 14.8915 6.575 14.8332 6.49167 14.7582C6.34167 14.5998 6.25 14.3832 6.25 14.1665C6.25 14.0582 6.275 13.9498 6.31667 13.8498C6.35833 13.7415 6.41667 13.6498 6.49167 13.5748C6.8 13.2665 7.36667 13.2665 7.675 13.5748C7.825 13.7332 7.91667 13.9498 7.91667 14.1665C7.91667 14.3832 7.825 14.5998 7.675 14.7582C7.51667 14.9082 7.3 14.9998 7.08333 14.9998ZM10 14.9998C9.78333 14.9998 9.56667 14.9082 9.40833 14.7582C9.25833 14.5998 9.16667 14.3832 9.16667 14.1665C9.16667 14.0582 9.19167 13.9498 9.23333 13.8498C9.275 13.7415 9.33333 13.6498 9.40833 13.5748C9.71667 13.2665 10.2833 13.2665 10.5917 13.5748C10.6667 13.6498 10.725 13.7415 10.7667 13.8498C10.8083 13.9498 10.8333 14.0582 10.8333 14.1665C10.8333 14.3832 10.7417 14.5998 10.5917 14.7582C10.4333 14.9082 10.2167 14.9998 10 14.9998ZM12.9167 14.9998C12.7 14.9998 12.4833 14.9082 12.325 14.7582C12.2479 14.6799 12.1882 14.5862 12.15 14.4832C12.1083 14.3832 12.0833 14.2748 12.0833 14.1665C12.0833 14.0582 12.1083 13.9498 12.15 13.8498C12.1917 13.7415 12.25 13.6498 12.325 13.5748C12.5167 13.3832 12.8083 13.2915 13.075 13.3498C13.1333 13.3582 13.1833 13.3748 13.2333 13.3998C13.2833 13.4165 13.3333 13.4415 13.3833 13.4748C13.425 13.4998 13.4667 13.5415 13.5083 13.5748C13.6583 13.7332 13.75 13.9498 13.75 14.1665C13.75 14.3832 13.6583 14.5998 13.5083 14.7582C13.35 14.9082 13.1333 14.9998 12.9167 14.9998ZM17.0833 8.19984H2.91667C2.575 8.19984 2.29167 7.9165 2.29167 7.57484C2.29167 7.23317 2.575 6.94984 2.91667 6.94984H17.0833C17.425 6.94984 17.7083 7.23317 17.7083 7.57484C17.7083 7.9165 17.425 8.19984 17.0833 8.19984Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M13.3333 18.9582H6.66667C3.625 18.9582 1.875 17.2082 1.875 14.1665V7.08317C1.875 4.0415 3.625 2.2915 6.66667 2.2915H13.3333C16.375 2.2915 18.125 4.0415 18.125 7.08317V14.1665C18.125 17.2082 16.375 18.9582 13.3333 18.9582ZM6.66667 3.5415C4.28333 3.5415 3.125 4.69984 3.125 7.08317V14.1665C3.125 16.5498 4.28333 17.7082 6.66667 17.7082H13.3333C15.7167 17.7082 16.875 16.5498 16.875 14.1665V7.08317C16.875 4.69984 15.7167 3.5415 13.3333 3.5415H6.66667Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>22, Nov 2023</span>
                                    </li>
                                </ul>
                                <h4 class="mt-20 pb-25 bor-bottom"><a href="blog-single.html"
                                        class="primary-hover">Rebecca's
                                        Charity
                                        Album A Brilliant Display</a></h4>
                                <a class="mt-4" href="blog-single.html"><span class="read-more fw-bold transition">Read
                                        More <i class="fa-solid fa-arrow-right ms-1"></i></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog area end here -->

        
        <!-- Testimonial area start here -->
        <section class="testimonial-area pt-120 pb-120">
            <div class="container">
                <div class="d-flex align-items-center justify-content-between flex-wrap gap-4 mb-60">
                    <div class="section-header">
                        <h5 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <i class="fa-regular fa-angles-left pe-1"></i>Our Priests <i
                                class="fa-regular fa-angles-right ps-1"></i>
                        </h5>
                        <h2 class="wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">Our Diocesan Priests
                        </h2>
                    </div>
                    <div class="arry-btn wow fadeInUp" data-wow-delay="400ms" data-wow-duration="1500ms">
                        <button class="arry-prev testimonial__arry-prev"><i
                                class="fa-regular fa-chevron-left"></i></button>
                        <button class="arry-next testimonial__arry-next active ml-10"><i
                                class="fa-regular fa-chevron-right"></i></button>
                    </div>
                </div>
            </div>
            <div class="swiper testimonial__slider">
                <div class="swiper-wrapper">
                    <?php if(!empty($getPriests)):
                        foreach ($getPriests as $key => $priest):?>
 <div class="swiper-slide">
                        <div class="testimonial__item">
                            <svg class="shape" width="59" height="67" viewBox="0 0 59 67" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <mask style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="59"
                                    height="67">
                                    <rect width="59" height="67" fill="#F74F22" />
                                </mask>
                                <g mask="url(#mask0_87_43)">
                                    <circle opacity="0.7" cx="59" cy="9" r="56" fill="#F74F22" />
                                    <circle cx="59" cy="9" r="47.5" fill="#F74F22" stroke="white"
                                        stroke-dasharray="2 2" />
                                </g>
                            </svg>

                            <div class="top">
                                <div class="image">
                                    <img src="<?=base_url('uploads/users/thumbs/' . imageCheck('users', getUserPhoto($priest['userID']), 1))?>" alt="image">
                                    <svg width="32" height="28" viewBox="0 0 32 28" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M29 28C30.625 28 32 26.625 32 25V10C32 4.4375 27.5 0 22 0H21.5C20.625 0 20 0.625 20 1.5V4.5C20 5.3125 20.625 6 21.5 6H22C24.1875 6 26 7.75 26 10V14H21C19.3125 14 18 15.3125 18 17V25C18 26.625 19.3125 28 21 28H29ZM11 28C12.625 28 14 26.625 14 25V10C14 4.4375 9.5 0 4 0H3.5C2.625 0 2 0.625 2 1.5V4.5C2 5.3125 2.625 6 3.5 6H4C6.1875 6 8 7.75 8 10V14H3C1.3125 14 0 15.3125 0 17V25C0 26.625 1.3125 28 3 28H11Z"
                                            fill="#F74F22" />
                                    </svg>

                                </div>
                                <div class="con">
                                  
                                    <h5><?=$priest['full_name']?></h5>
                                    <span><?=$priest['pr_parish']?></span>
                                </div>
                            </div>
                            <!-- <p class="mt-30">Dolor sit amet consectetur adipiscing elit. Integer nunc viverra the
                                laoreet
                                est, a pretium
                                metus aliquam eget. Maecenas
                                porta is nunc ut viverra. Aenean pulvinar maximus leo.</p> -->
                        </div>
                    </div>
                        <?php endforeach;endif;
                           
                        ?>

                   
                   
                </div>
            </div>
            <div class="btn-three mt-30">
                <span class="btn-circle">
                </span>
                <a href="cause-single.html" class="btn-inner">
                    <span class="btn-text">
                        View More
                    </span>
                </a>
            </div>
        </section>
        <!-- Testimonial area end here -->


        <!-- Event area start here -->
        <section class="event-area pt-120 pb-120 bg-image" data-background="/themes/frontend/assets/images/bg/event-bg-image.jpg">
            <div class="container-fluid">
                <div class="section-header text-center mb-60">
                    <h5 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <i class="fa-regular fa-angles-left pe-1"></i> Our EVENT <i
                            class="fa-regular fa-angles-right ps-1"></i>
                    </h5>
                    <h2 class="text-white wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">Posts</h2>                      
                </div>
                <div class="row g-4">
                    <div class="col-xl-6 wow fadeInDown" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="event__item h-100">
                            <div class="image h-100">
                                <img class="h-100" src="/themes/frontend/assets/images/event/event-image1.jpg" alt="image">
                            </div>
                            <div class="event__content">
                                <ul class="mb-4">
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_66_78)">
                                                <path
                                                    d="M8.25 10.0835C8.25 10.8128 8.53973 11.5123 9.05546 12.028C9.57118 12.5438 10.2707 12.8335 11 12.8335C11.7293 12.8335 12.4288 12.5438 12.9445 12.028C13.4603 11.5123 13.75 10.8128 13.75 10.0835C13.75 9.35415 13.4603 8.65468 12.9445 8.13895C12.4288 7.62323 11.7293 7.3335 11 7.3335C10.2707 7.3335 9.57118 7.62323 9.05546 8.13895C8.53973 8.65468 8.25 9.35415 8.25 10.0835Z"
                                                    stroke="#F74F22" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                                <path
                                                    d="M16.1856 15.2691L12.2962 19.1586C11.9524 19.502 11.4864 19.6949 11.0005 19.6949C10.5145 19.6949 10.0485 19.502 9.70474 19.1586L5.81441 15.2691C4.78886 14.2435 4.09047 12.9369 3.80754 11.5143C3.52461 10.0918 3.66986 8.61736 4.22491 7.27739C4.77997 5.93742 5.7199 4.79213 6.92585 3.98635C8.1318 3.18057 9.54961 2.75049 11 2.75049C12.4504 2.75049 13.8682 3.18057 15.0741 3.98635C16.2801 4.79213 17.22 5.93742 17.7751 7.27739C18.3301 8.61736 18.4754 10.0918 18.1924 11.5143C17.9095 12.9369 17.2111 14.2435 16.1856 15.2691Z"
                                                    stroke="#F74F22" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                            </g>
                                            <defs>
                                                <clipPath>
                                                    <rect width="22" height="22" fill="white" />
                                                </clipPath>
                                            </defs>
                                        </svg>
                                        <span>New york, USA</span>
                                    </li>
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M7.33333 5.271C6.9575 5.271 6.64583 4.95933 6.64583 4.5835V1.8335C6.64583 1.45766 6.9575 1.146 7.33333 1.146C7.70917 1.146 8.02083 1.45766 8.02083 1.8335V4.5835C8.02083 4.95933 7.70917 5.271 7.33333 5.271ZM14.6667 5.271C14.2908 5.271 13.9792 4.95933 13.9792 4.5835V1.8335C13.9792 1.45766 14.2908 1.146 14.6667 1.146C15.0425 1.146 15.3542 1.45766 15.3542 1.8335V4.5835C15.3542 4.95933 15.0425 5.271 14.6667 5.271ZM7.79167 13.2918C7.6725 13.2918 7.55333 13.2643 7.44333 13.2185C7.32417 13.1727 7.2325 13.1085 7.14083 13.026C6.97583 12.8518 6.875 12.6227 6.875 12.3752C6.875 12.256 6.9025 12.1368 6.94833 12.0268C6.99417 11.9168 7.05833 11.816 7.14083 11.7243C7.2325 11.6418 7.32417 11.5777 7.44333 11.5318C7.77333 11.3943 8.18583 11.4677 8.4425 11.7243C8.6075 11.8985 8.70833 12.1368 8.70833 12.3752C8.70833 12.4302 8.69917 12.4943 8.69 12.5585C8.68083 12.6135 8.6625 12.6685 8.635 12.7235C8.61667 12.7785 8.58917 12.8335 8.5525 12.8885C8.525 12.9343 8.47917 12.9802 8.4425 13.026C8.26833 13.191 8.03 13.2918 7.79167 13.2918ZM11 13.2918C10.8808 13.2918 10.7617 13.2643 10.6517 13.2185C10.5325 13.1727 10.4408 13.1085 10.3492 13.026C10.1842 12.8518 10.0833 12.6227 10.0833 12.3752C10.0833 12.256 10.1108 12.1368 10.1567 12.0268C10.2025 11.9168 10.2667 11.816 10.3492 11.7243C10.4408 11.6418 10.5325 11.5777 10.6517 11.5318C10.9817 11.3852 11.3942 11.4677 11.6508 11.7243C11.8158 11.8985 11.9167 12.1368 11.9167 12.3752C11.9167 12.4302 11.9075 12.4943 11.8983 12.5585C11.8892 12.6135 11.8708 12.6685 11.8433 12.7235C11.825 12.7785 11.7975 12.8335 11.7608 12.8885C11.7333 12.9343 11.6875 12.9802 11.6508 13.026C11.4767 13.191 11.2383 13.2918 11 13.2918ZM14.2083 13.2918C14.0892 13.2918 13.97 13.2643 13.86 13.2185C13.7408 13.1727 13.6492 13.1085 13.5575 13.026L13.4475 12.8885C13.4128 12.8374 13.385 12.7819 13.365 12.7235C13.3385 12.6716 13.32 12.6159 13.31 12.5585C13.3008 12.4943 13.2917 12.4302 13.2917 12.3752C13.2917 12.1368 13.3925 11.8985 13.5575 11.7243C13.6492 11.6418 13.7408 11.5777 13.86 11.5318C14.1992 11.3852 14.6025 11.4677 14.8592 11.7243C15.0242 11.8985 15.125 12.1368 15.125 12.3752C15.125 12.4302 15.1158 12.4943 15.1067 12.5585C15.0975 12.6135 15.0792 12.6685 15.0517 12.7235C15.0333 12.7785 15.0058 12.8335 14.9692 12.8885C14.9417 12.9343 14.8958 12.9802 14.8592 13.026C14.685 13.191 14.4467 13.2918 14.2083 13.2918ZM7.79167 16.5002C7.6725 16.5002 7.55333 16.4727 7.44333 16.4268C7.33333 16.381 7.2325 16.3168 7.14083 16.2343C6.97583 16.0602 6.875 15.8218 6.875 15.5835C6.875 15.4643 6.9025 15.3452 6.94833 15.2352C6.99417 15.116 7.05833 15.0152 7.14083 14.9327C7.48 14.5935 8.10333 14.5935 8.4425 14.9327C8.6075 15.1068 8.70833 15.3452 8.70833 15.5835C8.70833 15.8218 8.6075 16.0602 8.4425 16.2343C8.26833 16.3993 8.03 16.5002 7.79167 16.5002ZM11 16.5002C10.7617 16.5002 10.5233 16.3993 10.3492 16.2343C10.1842 16.0602 10.0833 15.8218 10.0833 15.5835C10.0833 15.4643 10.1108 15.3452 10.1567 15.2352C10.2025 15.116 10.2667 15.0152 10.3492 14.9327C10.6883 14.5935 11.3117 14.5935 11.6508 14.9327C11.7333 15.0152 11.7975 15.116 11.8433 15.2352C11.8892 15.3452 11.9167 15.4643 11.9167 15.5835C11.9167 15.8218 11.8158 16.0602 11.6508 16.2343C11.4767 16.3993 11.2383 16.5002 11 16.5002ZM14.2083 16.5002C13.97 16.5002 13.7317 16.3993 13.5575 16.2343C13.4727 16.1482 13.4071 16.0451 13.365 15.9318C13.3192 15.8218 13.2917 15.7027 13.2917 15.5835C13.2917 15.4643 13.3192 15.3452 13.365 15.2352C13.4108 15.116 13.475 15.0152 13.5575 14.9327C13.7683 14.7218 14.0892 14.621 14.3825 14.6852C14.4467 14.6943 14.5017 14.7127 14.5567 14.7402C14.6117 14.7585 14.6667 14.786 14.7217 14.8227C14.7675 14.8502 14.8133 14.896 14.8592 14.9327C15.0242 15.1068 15.125 15.3452 15.125 15.5835C15.125 15.8218 15.0242 16.0602 14.8592 16.2343C14.685 16.3993 14.4467 16.5002 14.2083 16.5002ZM18.7917 9.02016H3.20833C2.8325 9.02016 2.52083 8.7085 2.52083 8.33266C2.52083 7.95683 2.8325 7.64516 3.20833 7.64516H18.7917C19.1675 7.64516 19.4792 7.95683 19.4792 8.33266C19.4792 8.7085 19.1675 9.02016 18.7917 9.02016Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M14.6667 20.8543H7.33333C3.9875 20.8543 2.0625 18.9293 2.0625 15.5835V7.79183C2.0625 4.446 3.9875 2.521 7.33333 2.521H14.6667C18.0125 2.521 19.9375 4.446 19.9375 7.79183V15.5835C19.9375 18.9293 18.0125 20.8543 14.6667 20.8543ZM7.33333 3.896C4.71167 3.896 3.4375 5.17016 3.4375 7.79183V15.5835C3.4375 18.2052 4.71167 19.4793 7.33333 19.4793H14.6667C17.2883 19.4793 18.5625 18.2052 18.5625 15.5835V7.79183C18.5625 5.17016 17.2883 3.896 14.6667 3.896H7.33333Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>22, Nov 2023</span>
                                    </li>
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M14.9195 12.9429L11.852 10.6423V5.95607C11.852 5.48488 11.4712 5.104 11 5.104C10.5288 5.104 10.1479 5.48488 10.1479 5.95607V11.0684C10.1479 11.3368 10.274 11.5899 10.4887 11.7501L13.8969 14.3062C14.044 14.417 14.2232 14.4768 14.4073 14.4766C14.6672 14.4766 14.9228 14.3599 15.0898 14.135C15.3728 13.7592 15.2961 13.2249 14.9195 12.9429Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M11 0C4.93423 0 0 4.93423 0 11C0 17.0658 4.93423 22 11 22C17.0658 22 22 17.0658 22 11C22 4.93423 17.0658 0 11 0ZM11 20.2959C5.8749 20.2959 1.7041 16.1251 1.7041 11C1.7041 5.8749 5.8749 1.7041 11 1.7041C16.126 1.7041 20.2959 5.8749 20.2959 11C20.2959 16.1251 16.1251 20.2959 11 20.2959Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>09:00 PM</span>
                                    </li>
                                </ul>
                                <h3 class="mb-4"><a href="event-single.html" class="primary-hover">Rebecca's Album
                                        Supports
                                        Needy</a>
                                </h3>
                                <p>Embarrassing hidden in the middle of All the Lorem Ipsum generators on the Internet
                                    to
                                    repeat predefined chunks
                                    necessary, making this</p>
                                <a href="event-single.html" class="primary-hover fw-bold mt-4">EXPLORE MORE <i
                                        class="fa-regular fa-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 wow fadeInDown" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="event__item h-100">
                            <div class="image h-100">
                                <img class="h-100" src="/themes/frontend/assets/images/event/event-image2.jpg" alt="image">
                            </div>
                            <div class="event__content">
                                <ul class="mb-4">
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_66_78)">
                                                <path
                                                    d="M8.25 10.0835C8.25 10.8128 8.53973 11.5123 9.05546 12.028C9.57118 12.5438 10.2707 12.8335 11 12.8335C11.7293 12.8335 12.4288 12.5438 12.9445 12.028C13.4603 11.5123 13.75 10.8128 13.75 10.0835C13.75 9.35415 13.4603 8.65468 12.9445 8.13895C12.4288 7.62323 11.7293 7.3335 11 7.3335C10.2707 7.3335 9.57118 7.62323 9.05546 8.13895C8.53973 8.65468 8.25 9.35415 8.25 10.0835Z"
                                                    stroke="#F74F22" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                                <path
                                                    d="M16.1856 15.2691L12.2962 19.1586C11.9524 19.502 11.4864 19.6949 11.0005 19.6949C10.5145 19.6949 10.0485 19.502 9.70474 19.1586L5.81441 15.2691C4.78886 14.2435 4.09047 12.9369 3.80754 11.5143C3.52461 10.0918 3.66986 8.61736 4.22491 7.27739C4.77997 5.93742 5.7199 4.79213 6.92585 3.98635C8.1318 3.18057 9.54961 2.75049 11 2.75049C12.4504 2.75049 13.8682 3.18057 15.0741 3.98635C16.2801 4.79213 17.22 5.93742 17.7751 7.27739C18.3301 8.61736 18.4754 10.0918 18.1924 11.5143C17.9095 12.9369 17.2111 14.2435 16.1856 15.2691Z"
                                                    stroke="#F74F22" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                            </g>
                                            <defs>
                                                <clipPath>
                                                    <rect width="22" height="22" fill="white" />
                                                </clipPath>
                                            </defs>
                                        </svg>
                                        <span>New york, USA</span>
                                    </li>
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M7.33333 5.271C6.9575 5.271 6.64583 4.95933 6.64583 4.5835V1.8335C6.64583 1.45766 6.9575 1.146 7.33333 1.146C7.70917 1.146 8.02083 1.45766 8.02083 1.8335V4.5835C8.02083 4.95933 7.70917 5.271 7.33333 5.271ZM14.6667 5.271C14.2908 5.271 13.9792 4.95933 13.9792 4.5835V1.8335C13.9792 1.45766 14.2908 1.146 14.6667 1.146C15.0425 1.146 15.3542 1.45766 15.3542 1.8335V4.5835C15.3542 4.95933 15.0425 5.271 14.6667 5.271ZM7.79167 13.2918C7.6725 13.2918 7.55333 13.2643 7.44333 13.2185C7.32417 13.1727 7.2325 13.1085 7.14083 13.026C6.97583 12.8518 6.875 12.6227 6.875 12.3752C6.875 12.256 6.9025 12.1368 6.94833 12.0268C6.99417 11.9168 7.05833 11.816 7.14083 11.7243C7.2325 11.6418 7.32417 11.5777 7.44333 11.5318C7.77333 11.3943 8.18583 11.4677 8.4425 11.7243C8.6075 11.8985 8.70833 12.1368 8.70833 12.3752C8.70833 12.4302 8.69917 12.4943 8.69 12.5585C8.68083 12.6135 8.6625 12.6685 8.635 12.7235C8.61667 12.7785 8.58917 12.8335 8.5525 12.8885C8.525 12.9343 8.47917 12.9802 8.4425 13.026C8.26833 13.191 8.03 13.2918 7.79167 13.2918ZM11 13.2918C10.8808 13.2918 10.7617 13.2643 10.6517 13.2185C10.5325 13.1727 10.4408 13.1085 10.3492 13.026C10.1842 12.8518 10.0833 12.6227 10.0833 12.3752C10.0833 12.256 10.1108 12.1368 10.1567 12.0268C10.2025 11.9168 10.2667 11.816 10.3492 11.7243C10.4408 11.6418 10.5325 11.5777 10.6517 11.5318C10.9817 11.3852 11.3942 11.4677 11.6508 11.7243C11.8158 11.8985 11.9167 12.1368 11.9167 12.3752C11.9167 12.4302 11.9075 12.4943 11.8983 12.5585C11.8892 12.6135 11.8708 12.6685 11.8433 12.7235C11.825 12.7785 11.7975 12.8335 11.7608 12.8885C11.7333 12.9343 11.6875 12.9802 11.6508 13.026C11.4767 13.191 11.2383 13.2918 11 13.2918ZM14.2083 13.2918C14.0892 13.2918 13.97 13.2643 13.86 13.2185C13.7408 13.1727 13.6492 13.1085 13.5575 13.026L13.4475 12.8885C13.4128 12.8374 13.385 12.7819 13.365 12.7235C13.3385 12.6716 13.32 12.6159 13.31 12.5585C13.3008 12.4943 13.2917 12.4302 13.2917 12.3752C13.2917 12.1368 13.3925 11.8985 13.5575 11.7243C13.6492 11.6418 13.7408 11.5777 13.86 11.5318C14.1992 11.3852 14.6025 11.4677 14.8592 11.7243C15.0242 11.8985 15.125 12.1368 15.125 12.3752C15.125 12.4302 15.1158 12.4943 15.1067 12.5585C15.0975 12.6135 15.0792 12.6685 15.0517 12.7235C15.0333 12.7785 15.0058 12.8335 14.9692 12.8885C14.9417 12.9343 14.8958 12.9802 14.8592 13.026C14.685 13.191 14.4467 13.2918 14.2083 13.2918ZM7.79167 16.5002C7.6725 16.5002 7.55333 16.4727 7.44333 16.4268C7.33333 16.381 7.2325 16.3168 7.14083 16.2343C6.97583 16.0602 6.875 15.8218 6.875 15.5835C6.875 15.4643 6.9025 15.3452 6.94833 15.2352C6.99417 15.116 7.05833 15.0152 7.14083 14.9327C7.48 14.5935 8.10333 14.5935 8.4425 14.9327C8.6075 15.1068 8.70833 15.3452 8.70833 15.5835C8.70833 15.8218 8.6075 16.0602 8.4425 16.2343C8.26833 16.3993 8.03 16.5002 7.79167 16.5002ZM11 16.5002C10.7617 16.5002 10.5233 16.3993 10.3492 16.2343C10.1842 16.0602 10.0833 15.8218 10.0833 15.5835C10.0833 15.4643 10.1108 15.3452 10.1567 15.2352C10.2025 15.116 10.2667 15.0152 10.3492 14.9327C10.6883 14.5935 11.3117 14.5935 11.6508 14.9327C11.7333 15.0152 11.7975 15.116 11.8433 15.2352C11.8892 15.3452 11.9167 15.4643 11.9167 15.5835C11.9167 15.8218 11.8158 16.0602 11.6508 16.2343C11.4767 16.3993 11.2383 16.5002 11 16.5002ZM14.2083 16.5002C13.97 16.5002 13.7317 16.3993 13.5575 16.2343C13.4727 16.1482 13.4071 16.0451 13.365 15.9318C13.3192 15.8218 13.2917 15.7027 13.2917 15.5835C13.2917 15.4643 13.3192 15.3452 13.365 15.2352C13.4108 15.116 13.475 15.0152 13.5575 14.9327C13.7683 14.7218 14.0892 14.621 14.3825 14.6852C14.4467 14.6943 14.5017 14.7127 14.5567 14.7402C14.6117 14.7585 14.6667 14.786 14.7217 14.8227C14.7675 14.8502 14.8133 14.896 14.8592 14.9327C15.0242 15.1068 15.125 15.3452 15.125 15.5835C15.125 15.8218 15.0242 16.0602 14.8592 16.2343C14.685 16.3993 14.4467 16.5002 14.2083 16.5002ZM18.7917 9.02016H3.20833C2.8325 9.02016 2.52083 8.7085 2.52083 8.33266C2.52083 7.95683 2.8325 7.64516 3.20833 7.64516H18.7917C19.1675 7.64516 19.4792 7.95683 19.4792 8.33266C19.4792 8.7085 19.1675 9.02016 18.7917 9.02016Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M14.6667 20.8543H7.33333C3.9875 20.8543 2.0625 18.9293 2.0625 15.5835V7.79183C2.0625 4.446 3.9875 2.521 7.33333 2.521H14.6667C18.0125 2.521 19.9375 4.446 19.9375 7.79183V15.5835C19.9375 18.9293 18.0125 20.8543 14.6667 20.8543ZM7.33333 3.896C4.71167 3.896 3.4375 5.17016 3.4375 7.79183V15.5835C3.4375 18.2052 4.71167 19.4793 7.33333 19.4793H14.6667C17.2883 19.4793 18.5625 18.2052 18.5625 15.5835V7.79183C18.5625 5.17016 17.2883 3.896 14.6667 3.896H7.33333Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>22, Nov 2023</span>
                                    </li>
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M14.9195 12.9429L11.852 10.6423V5.95607C11.852 5.48488 11.4712 5.104 11 5.104C10.5288 5.104 10.1479 5.48488 10.1479 5.95607V11.0684C10.1479 11.3368 10.274 11.5899 10.4887 11.7501L13.8969 14.3062C14.044 14.417 14.2232 14.4768 14.4073 14.4766C14.6672 14.4766 14.9228 14.3599 15.0898 14.135C15.3728 13.7592 15.2961 13.2249 14.9195 12.9429Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M11 0C4.93423 0 0 4.93423 0 11C0 17.0658 4.93423 22 11 22C17.0658 22 22 17.0658 22 11C22 4.93423 17.0658 0 11 0ZM11 20.2959C5.8749 20.2959 1.7041 16.1251 1.7041 11C1.7041 5.8749 5.8749 1.7041 11 1.7041C16.126 1.7041 20.2959 5.8749 20.2959 11C20.2959 16.1251 16.1251 20.2959 11 20.2959Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>09:00 PM</span>
                                    </li>
                                </ul>
                                <h3 class="mb-4"><a href="event-single.html" class="primary-hover">Rebecca's Charity
                                        Album A
                                        Brilliant
                                        Display</a>
                                </h3>
                                <p>Embarrassing hidden in the middle of All the Lorem Ipsum generators on the Internet
                                    to
                                    repeat predefined chunks
                                    necessary, making this</p>
                                <a href="event-single.html" class="primary-hover fw-bold mt-4">EXPLORE MORE <i
                                        class="fa-regular fa-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="event__item h-100">
                            <div class="image h-100">
                                <img class="h-100" src="/themes/frontend/assets/images/event/event-image3.jpg" alt="image">
                            </div>
                            <div class="event__content">
                                <ul class="mb-4">
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_66_78)">
                                                <path
                                                    d="M8.25 10.0835C8.25 10.8128 8.53973 11.5123 9.05546 12.028C9.57118 12.5438 10.2707 12.8335 11 12.8335C11.7293 12.8335 12.4288 12.5438 12.9445 12.028C13.4603 11.5123 13.75 10.8128 13.75 10.0835C13.75 9.35415 13.4603 8.65468 12.9445 8.13895C12.4288 7.62323 11.7293 7.3335 11 7.3335C10.2707 7.3335 9.57118 7.62323 9.05546 8.13895C8.53973 8.65468 8.25 9.35415 8.25 10.0835Z"
                                                    stroke="#F74F22" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                                <path
                                                    d="M16.1856 15.2691L12.2962 19.1586C11.9524 19.502 11.4864 19.6949 11.0005 19.6949C10.5145 19.6949 10.0485 19.502 9.70474 19.1586L5.81441 15.2691C4.78886 14.2435 4.09047 12.9369 3.80754 11.5143C3.52461 10.0918 3.66986 8.61736 4.22491 7.27739C4.77997 5.93742 5.7199 4.79213 6.92585 3.98635C8.1318 3.18057 9.54961 2.75049 11 2.75049C12.4504 2.75049 13.8682 3.18057 15.0741 3.98635C16.2801 4.79213 17.22 5.93742 17.7751 7.27739C18.3301 8.61736 18.4754 10.0918 18.1924 11.5143C17.9095 12.9369 17.2111 14.2435 16.1856 15.2691Z"
                                                    stroke="#F74F22" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                            </g>
                                            <defs>
                                                <clipPath>
                                                    <rect width="22" height="22" fill="white" />
                                                </clipPath>
                                            </defs>
                                        </svg>
                                        <span>New york, USA</span>
                                    </li>
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M7.33333 5.271C6.9575 5.271 6.64583 4.95933 6.64583 4.5835V1.8335C6.64583 1.45766 6.9575 1.146 7.33333 1.146C7.70917 1.146 8.02083 1.45766 8.02083 1.8335V4.5835C8.02083 4.95933 7.70917 5.271 7.33333 5.271ZM14.6667 5.271C14.2908 5.271 13.9792 4.95933 13.9792 4.5835V1.8335C13.9792 1.45766 14.2908 1.146 14.6667 1.146C15.0425 1.146 15.3542 1.45766 15.3542 1.8335V4.5835C15.3542 4.95933 15.0425 5.271 14.6667 5.271ZM7.79167 13.2918C7.6725 13.2918 7.55333 13.2643 7.44333 13.2185C7.32417 13.1727 7.2325 13.1085 7.14083 13.026C6.97583 12.8518 6.875 12.6227 6.875 12.3752C6.875 12.256 6.9025 12.1368 6.94833 12.0268C6.99417 11.9168 7.05833 11.816 7.14083 11.7243C7.2325 11.6418 7.32417 11.5777 7.44333 11.5318C7.77333 11.3943 8.18583 11.4677 8.4425 11.7243C8.6075 11.8985 8.70833 12.1368 8.70833 12.3752C8.70833 12.4302 8.69917 12.4943 8.69 12.5585C8.68083 12.6135 8.6625 12.6685 8.635 12.7235C8.61667 12.7785 8.58917 12.8335 8.5525 12.8885C8.525 12.9343 8.47917 12.9802 8.4425 13.026C8.26833 13.191 8.03 13.2918 7.79167 13.2918ZM11 13.2918C10.8808 13.2918 10.7617 13.2643 10.6517 13.2185C10.5325 13.1727 10.4408 13.1085 10.3492 13.026C10.1842 12.8518 10.0833 12.6227 10.0833 12.3752C10.0833 12.256 10.1108 12.1368 10.1567 12.0268C10.2025 11.9168 10.2667 11.816 10.3492 11.7243C10.4408 11.6418 10.5325 11.5777 10.6517 11.5318C10.9817 11.3852 11.3942 11.4677 11.6508 11.7243C11.8158 11.8985 11.9167 12.1368 11.9167 12.3752C11.9167 12.4302 11.9075 12.4943 11.8983 12.5585C11.8892 12.6135 11.8708 12.6685 11.8433 12.7235C11.825 12.7785 11.7975 12.8335 11.7608 12.8885C11.7333 12.9343 11.6875 12.9802 11.6508 13.026C11.4767 13.191 11.2383 13.2918 11 13.2918ZM14.2083 13.2918C14.0892 13.2918 13.97 13.2643 13.86 13.2185C13.7408 13.1727 13.6492 13.1085 13.5575 13.026L13.4475 12.8885C13.4128 12.8374 13.385 12.7819 13.365 12.7235C13.3385 12.6716 13.32 12.6159 13.31 12.5585C13.3008 12.4943 13.2917 12.4302 13.2917 12.3752C13.2917 12.1368 13.3925 11.8985 13.5575 11.7243C13.6492 11.6418 13.7408 11.5777 13.86 11.5318C14.1992 11.3852 14.6025 11.4677 14.8592 11.7243C15.0242 11.8985 15.125 12.1368 15.125 12.3752C15.125 12.4302 15.1158 12.4943 15.1067 12.5585C15.0975 12.6135 15.0792 12.6685 15.0517 12.7235C15.0333 12.7785 15.0058 12.8335 14.9692 12.8885C14.9417 12.9343 14.8958 12.9802 14.8592 13.026C14.685 13.191 14.4467 13.2918 14.2083 13.2918ZM7.79167 16.5002C7.6725 16.5002 7.55333 16.4727 7.44333 16.4268C7.33333 16.381 7.2325 16.3168 7.14083 16.2343C6.97583 16.0602 6.875 15.8218 6.875 15.5835C6.875 15.4643 6.9025 15.3452 6.94833 15.2352C6.99417 15.116 7.05833 15.0152 7.14083 14.9327C7.48 14.5935 8.10333 14.5935 8.4425 14.9327C8.6075 15.1068 8.70833 15.3452 8.70833 15.5835C8.70833 15.8218 8.6075 16.0602 8.4425 16.2343C8.26833 16.3993 8.03 16.5002 7.79167 16.5002ZM11 16.5002C10.7617 16.5002 10.5233 16.3993 10.3492 16.2343C10.1842 16.0602 10.0833 15.8218 10.0833 15.5835C10.0833 15.4643 10.1108 15.3452 10.1567 15.2352C10.2025 15.116 10.2667 15.0152 10.3492 14.9327C10.6883 14.5935 11.3117 14.5935 11.6508 14.9327C11.7333 15.0152 11.7975 15.116 11.8433 15.2352C11.8892 15.3452 11.9167 15.4643 11.9167 15.5835C11.9167 15.8218 11.8158 16.0602 11.6508 16.2343C11.4767 16.3993 11.2383 16.5002 11 16.5002ZM14.2083 16.5002C13.97 16.5002 13.7317 16.3993 13.5575 16.2343C13.4727 16.1482 13.4071 16.0451 13.365 15.9318C13.3192 15.8218 13.2917 15.7027 13.2917 15.5835C13.2917 15.4643 13.3192 15.3452 13.365 15.2352C13.4108 15.116 13.475 15.0152 13.5575 14.9327C13.7683 14.7218 14.0892 14.621 14.3825 14.6852C14.4467 14.6943 14.5017 14.7127 14.5567 14.7402C14.6117 14.7585 14.6667 14.786 14.7217 14.8227C14.7675 14.8502 14.8133 14.896 14.8592 14.9327C15.0242 15.1068 15.125 15.3452 15.125 15.5835C15.125 15.8218 15.0242 16.0602 14.8592 16.2343C14.685 16.3993 14.4467 16.5002 14.2083 16.5002ZM18.7917 9.02016H3.20833C2.8325 9.02016 2.52083 8.7085 2.52083 8.33266C2.52083 7.95683 2.8325 7.64516 3.20833 7.64516H18.7917C19.1675 7.64516 19.4792 7.95683 19.4792 8.33266C19.4792 8.7085 19.1675 9.02016 18.7917 9.02016Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M14.6667 20.8543H7.33333C3.9875 20.8543 2.0625 18.9293 2.0625 15.5835V7.79183C2.0625 4.446 3.9875 2.521 7.33333 2.521H14.6667C18.0125 2.521 19.9375 4.446 19.9375 7.79183V15.5835C19.9375 18.9293 18.0125 20.8543 14.6667 20.8543ZM7.33333 3.896C4.71167 3.896 3.4375 5.17016 3.4375 7.79183V15.5835C3.4375 18.2052 4.71167 19.4793 7.33333 19.4793H14.6667C17.2883 19.4793 18.5625 18.2052 18.5625 15.5835V7.79183C18.5625 5.17016 17.2883 3.896 14.6667 3.896H7.33333Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>22, Nov 2023</span>
                                    </li>
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M14.9195 12.9429L11.852 10.6423V5.95607C11.852 5.48488 11.4712 5.104 11 5.104C10.5288 5.104 10.1479 5.48488 10.1479 5.95607V11.0684C10.1479 11.3368 10.274 11.5899 10.4887 11.7501L13.8969 14.3062C14.044 14.417 14.2232 14.4768 14.4073 14.4766C14.6672 14.4766 14.9228 14.3599 15.0898 14.135C15.3728 13.7592 15.2961 13.2249 14.9195 12.9429Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M11 0C4.93423 0 0 4.93423 0 11C0 17.0658 4.93423 22 11 22C17.0658 22 22 17.0658 22 11C22 4.93423 17.0658 0 11 0ZM11 20.2959C5.8749 20.2959 1.7041 16.1251 1.7041 11C1.7041 5.8749 5.8749 1.7041 11 1.7041C16.126 1.7041 20.2959 5.8749 20.2959 11C20.2959 16.1251 16.1251 20.2959 11 20.2959Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>09:00 PM</span>
                                    </li>
                                </ul>
                                <h3 class="mb-4"><a href="event-single.html" class="primary-hover">Rebecca's Charity
                                        Showcases
                                        Nation's</a>
                                </h3>
                                <p>Embarrassing hidden in the middle of All the Lorem Ipsum generators on the Internet
                                    to
                                    repeat predefined chunks
                                    necessary, making this</p>
                                <a href="event-single.html" class="primary-hover fw-bold mt-4">EXPLORE MORE <i
                                        class="fa-regular fa-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="event__item h-100">
                            <div class="image h-100">
                                <img class="h-100" src="/themes/frontend/assets/images/event/event-image4.jpg" alt="image">
                            </div>
                            <div class="event__content">
                                <ul class="mb-4">
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_66_78)">
                                                <path
                                                    d="M8.25 10.0835C8.25 10.8128 8.53973 11.5123 9.05546 12.028C9.57118 12.5438 10.2707 12.8335 11 12.8335C11.7293 12.8335 12.4288 12.5438 12.9445 12.028C13.4603 11.5123 13.75 10.8128 13.75 10.0835C13.75 9.35415 13.4603 8.65468 12.9445 8.13895C12.4288 7.62323 11.7293 7.3335 11 7.3335C10.2707 7.3335 9.57118 7.62323 9.05546 8.13895C8.53973 8.65468 8.25 9.35415 8.25 10.0835Z"
                                                    stroke="#F74F22" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                                <path
                                                    d="M16.1856 15.2691L12.2962 19.1586C11.9524 19.502 11.4864 19.6949 11.0005 19.6949C10.5145 19.6949 10.0485 19.502 9.70474 19.1586L5.81441 15.2691C4.78886 14.2435 4.09047 12.9369 3.80754 11.5143C3.52461 10.0918 3.66986 8.61736 4.22491 7.27739C4.77997 5.93742 5.7199 4.79213 6.92585 3.98635C8.1318 3.18057 9.54961 2.75049 11 2.75049C12.4504 2.75049 13.8682 3.18057 15.0741 3.98635C16.2801 4.79213 17.22 5.93742 17.7751 7.27739C18.3301 8.61736 18.4754 10.0918 18.1924 11.5143C17.9095 12.9369 17.2111 14.2435 16.1856 15.2691Z"
                                                    stroke="#F74F22" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                            </g>
                                            <defs>
                                                <clipPath>
                                                    <rect width="22" height="22" fill="white" />
                                                </clipPath>
                                            </defs>
                                        </svg>
                                        <span>New york, USA</span>
                                    </li>
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M7.33333 5.271C6.9575 5.271 6.64583 4.95933 6.64583 4.5835V1.8335C6.64583 1.45766 6.9575 1.146 7.33333 1.146C7.70917 1.146 8.02083 1.45766 8.02083 1.8335V4.5835C8.02083 4.95933 7.70917 5.271 7.33333 5.271ZM14.6667 5.271C14.2908 5.271 13.9792 4.95933 13.9792 4.5835V1.8335C13.9792 1.45766 14.2908 1.146 14.6667 1.146C15.0425 1.146 15.3542 1.45766 15.3542 1.8335V4.5835C15.3542 4.95933 15.0425 5.271 14.6667 5.271ZM7.79167 13.2918C7.6725 13.2918 7.55333 13.2643 7.44333 13.2185C7.32417 13.1727 7.2325 13.1085 7.14083 13.026C6.97583 12.8518 6.875 12.6227 6.875 12.3752C6.875 12.256 6.9025 12.1368 6.94833 12.0268C6.99417 11.9168 7.05833 11.816 7.14083 11.7243C7.2325 11.6418 7.32417 11.5777 7.44333 11.5318C7.77333 11.3943 8.18583 11.4677 8.4425 11.7243C8.6075 11.8985 8.70833 12.1368 8.70833 12.3752C8.70833 12.4302 8.69917 12.4943 8.69 12.5585C8.68083 12.6135 8.6625 12.6685 8.635 12.7235C8.61667 12.7785 8.58917 12.8335 8.5525 12.8885C8.525 12.9343 8.47917 12.9802 8.4425 13.026C8.26833 13.191 8.03 13.2918 7.79167 13.2918ZM11 13.2918C10.8808 13.2918 10.7617 13.2643 10.6517 13.2185C10.5325 13.1727 10.4408 13.1085 10.3492 13.026C10.1842 12.8518 10.0833 12.6227 10.0833 12.3752C10.0833 12.256 10.1108 12.1368 10.1567 12.0268C10.2025 11.9168 10.2667 11.816 10.3492 11.7243C10.4408 11.6418 10.5325 11.5777 10.6517 11.5318C10.9817 11.3852 11.3942 11.4677 11.6508 11.7243C11.8158 11.8985 11.9167 12.1368 11.9167 12.3752C11.9167 12.4302 11.9075 12.4943 11.8983 12.5585C11.8892 12.6135 11.8708 12.6685 11.8433 12.7235C11.825 12.7785 11.7975 12.8335 11.7608 12.8885C11.7333 12.9343 11.6875 12.9802 11.6508 13.026C11.4767 13.191 11.2383 13.2918 11 13.2918ZM14.2083 13.2918C14.0892 13.2918 13.97 13.2643 13.86 13.2185C13.7408 13.1727 13.6492 13.1085 13.5575 13.026L13.4475 12.8885C13.4128 12.8374 13.385 12.7819 13.365 12.7235C13.3385 12.6716 13.32 12.6159 13.31 12.5585C13.3008 12.4943 13.2917 12.4302 13.2917 12.3752C13.2917 12.1368 13.3925 11.8985 13.5575 11.7243C13.6492 11.6418 13.7408 11.5777 13.86 11.5318C14.1992 11.3852 14.6025 11.4677 14.8592 11.7243C15.0242 11.8985 15.125 12.1368 15.125 12.3752C15.125 12.4302 15.1158 12.4943 15.1067 12.5585C15.0975 12.6135 15.0792 12.6685 15.0517 12.7235C15.0333 12.7785 15.0058 12.8335 14.9692 12.8885C14.9417 12.9343 14.8958 12.9802 14.8592 13.026C14.685 13.191 14.4467 13.2918 14.2083 13.2918ZM7.79167 16.5002C7.6725 16.5002 7.55333 16.4727 7.44333 16.4268C7.33333 16.381 7.2325 16.3168 7.14083 16.2343C6.97583 16.0602 6.875 15.8218 6.875 15.5835C6.875 15.4643 6.9025 15.3452 6.94833 15.2352C6.99417 15.116 7.05833 15.0152 7.14083 14.9327C7.48 14.5935 8.10333 14.5935 8.4425 14.9327C8.6075 15.1068 8.70833 15.3452 8.70833 15.5835C8.70833 15.8218 8.6075 16.0602 8.4425 16.2343C8.26833 16.3993 8.03 16.5002 7.79167 16.5002ZM11 16.5002C10.7617 16.5002 10.5233 16.3993 10.3492 16.2343C10.1842 16.0602 10.0833 15.8218 10.0833 15.5835C10.0833 15.4643 10.1108 15.3452 10.1567 15.2352C10.2025 15.116 10.2667 15.0152 10.3492 14.9327C10.6883 14.5935 11.3117 14.5935 11.6508 14.9327C11.7333 15.0152 11.7975 15.116 11.8433 15.2352C11.8892 15.3452 11.9167 15.4643 11.9167 15.5835C11.9167 15.8218 11.8158 16.0602 11.6508 16.2343C11.4767 16.3993 11.2383 16.5002 11 16.5002ZM14.2083 16.5002C13.97 16.5002 13.7317 16.3993 13.5575 16.2343C13.4727 16.1482 13.4071 16.0451 13.365 15.9318C13.3192 15.8218 13.2917 15.7027 13.2917 15.5835C13.2917 15.4643 13.3192 15.3452 13.365 15.2352C13.4108 15.116 13.475 15.0152 13.5575 14.9327C13.7683 14.7218 14.0892 14.621 14.3825 14.6852C14.4467 14.6943 14.5017 14.7127 14.5567 14.7402C14.6117 14.7585 14.6667 14.786 14.7217 14.8227C14.7675 14.8502 14.8133 14.896 14.8592 14.9327C15.0242 15.1068 15.125 15.3452 15.125 15.5835C15.125 15.8218 15.0242 16.0602 14.8592 16.2343C14.685 16.3993 14.4467 16.5002 14.2083 16.5002ZM18.7917 9.02016H3.20833C2.8325 9.02016 2.52083 8.7085 2.52083 8.33266C2.52083 7.95683 2.8325 7.64516 3.20833 7.64516H18.7917C19.1675 7.64516 19.4792 7.95683 19.4792 8.33266C19.4792 8.7085 19.1675 9.02016 18.7917 9.02016Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M14.6667 20.8543H7.33333C3.9875 20.8543 2.0625 18.9293 2.0625 15.5835V7.79183C2.0625 4.446 3.9875 2.521 7.33333 2.521H14.6667C18.0125 2.521 19.9375 4.446 19.9375 7.79183V15.5835C19.9375 18.9293 18.0125 20.8543 14.6667 20.8543ZM7.33333 3.896C4.71167 3.896 3.4375 5.17016 3.4375 7.79183V15.5835C3.4375 18.2052 4.71167 19.4793 7.33333 19.4793H14.6667C17.2883 19.4793 18.5625 18.2052 18.5625 15.5835V7.79183C18.5625 5.17016 17.2883 3.896 14.6667 3.896H7.33333Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>22, Nov 2023</span>
                                    </li>
                                    <li>
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M14.9195 12.9429L11.852 10.6423V5.95607C11.852 5.48488 11.4712 5.104 11 5.104C10.5288 5.104 10.1479 5.48488 10.1479 5.95607V11.0684C10.1479 11.3368 10.274 11.5899 10.4887 11.7501L13.8969 14.3062C14.044 14.417 14.2232 14.4768 14.4073 14.4766C14.6672 14.4766 14.9228 14.3599 15.0898 14.135C15.3728 13.7592 15.2961 13.2249 14.9195 12.9429Z"
                                                fill="#F74F22" />
                                            <path
                                                d="M11 0C4.93423 0 0 4.93423 0 11C0 17.0658 4.93423 22 11 22C17.0658 22 22 17.0658 22 11C22 4.93423 17.0658 0 11 0ZM11 20.2959C5.8749 20.2959 1.7041 16.1251 1.7041 11C1.7041 5.8749 5.8749 1.7041 11 1.7041C16.126 1.7041 20.2959 5.8749 20.2959 11C20.2959 16.1251 16.1251 20.2959 11 20.2959Z"
                                                fill="#F74F22" />
                                        </svg>
                                        <span>09:00 PM</span>
                                    </li>
                                </ul>
                                <h3 class="mb-4"><a href="event-single.html" class="primary-hover">A Nation's
                                        Benevolence
                                        Displayed</a>
                                </h3>
                                <p>Embarrassing hidden in the middle of All the Lorem Ipsum generators on the Internet
                                    to
                                    repeat predefined chunks
                                    necessary, making this</p>
                                <a href="event-single.html" class="primary-hover fw-bold mt-4">EXPLORE MORE <i
                                        class="fa-regular fa-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="btn-three mt-30">
                        <span class="btn-circle">
                        </span>
                        <a href="cause-single.html" class="btn-inner">
                            <span class="btn-text">
                                View More
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Event area end here -->

        <section class="project-area pt-120 pb-120">
            <div class="container">
            <div class="section-header text-center mb-60">
                    <h5 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <i class="fa-regular fa-angles-left pe-1"></i> Our GALLERY <i
                            class="fa-regular fa-angles-right ps-1"></i>
                    </h5>
                    <h2 class="text wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">Gallery</h2>                      
                </div>
                <div class="row g-4">
                    <div class="col-md-6 wow fadeInDown" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="project__item">
                            <div class="image">
                                <img src="themes/frontend/assets/images/project/project-image1.jpg" alt="image">
                            </div>
                            <div class="project__content">
                                <div class="con">
                                    <h4><a href="project-single.html" class="text-white">Leslie Alexander</a></h4>
                                    <span class="text-white">Volunteer</span>
                                </div>
                                <a href="project-single.html" class="next-btn"><i
                                        class="fa-regular fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 wow fadeInDown" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="project__item">
                            <div class="image">
                                <img src="themes/frontend/assets/images/project/project-image2.jpg" alt="image">
                            </div>
                            <div class="project__content">
                                <div class="con">
                                    <h4><a href="project-single.html" class="text-white">Leslie Alexander</a></h4>
                                    <span class="text-white">Volunteer</span>
                                </div>
                                <a href="project-single.html" class="next-btn"><i
                                        class="fa-regular fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="project__item">
                            <div class="image">
                                <img src="themes/frontend/assets/images/project/project-image-big.jpg" alt="image">
                            </div>
                            <div class="project__content">
                                <div class="con">
                                    <h4><a href="project-single.html" class="text-white">Leslie Alexander</a></h4>
                                    <span class="text-white">Volunteer</span>
                                </div>
                                <a href="project-single.html" class="next-btn"><i
                                        class="fa-regular fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="project__item">
                            <div class="image">
                                <img src="themes/frontend/assets/images/project/project-image-sm.jpg" alt="image">
                            </div>
                            <div class="project__content">
                                <div class="con">
                                    <h4><a href="project-single.html" class="text-white">Leslie Alexander</a></h4>
                                    <span class="text-white">Volunteer</span>
                                </div>
                                <a href="project-single.html" class="next-btn"><i
                                        class="fa-regular fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 wow fadeInDown" data-wow-delay="00ms" data-wow-duration="1500ms">
                        <div class="project__item">
                            <div class="image">
                                <img src="themes/frontend/assets/images/project/project-image3.jpg" alt="image">
                            </div>
                            <div class="project__content">
                                <div class="con">
                                    <h4><a href="project-single.html" class="text-white">Leslie Alexander</a></h4>
                                    <span class="text-white">Volunteer</span>
                                </div>
                                <a href="project-single.html" class="next-btn"><i
                                        class="fa-regular fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 wow fadeInDown" data-wow-delay="200ms" data-wow-duration="1500ms">
                        <div class="project__item">
                            <div class="image">
                                <img src="themes/frontend/assets/images/project/project-image4.jpg" alt="image">
                            </div>
                            <div class="project__content">
                                <div class="con">
                                    <h4><a href="project-single.html" class="text-white">Leslie Alexander</a></h4>
                                    <span class="text-white">Volunteer</span>
                                </div>
                                <a href="project-single.html" class="next-btn"><i
                                        class="fa-regular fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-three mt-30">
                    <span class="btn-circle">
                    </span>
                    <a href="cause-single.html" class="btn-inner">
                        <span class="btn-text">
                            View More
                        </span>
                    </a>
                </div>
            </div>
        </section>


