<?php 
if(empty($pageName)){
  die('page name missing');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kuzhithurai Diocese</title>
    <!-- Favicon img -->
    <link rel="shortcut icon" href="<?php echo get_favicon_url(); ?>">
    <!-- Bootstarp min css -->
    <link rel="stylesheet" href="/themes/frontend/assets/css/bootstrap.min.css">
    <!-- Mean menu css -->
    <link rel="stylesheet" href="/themes/frontend/assets/css/meanmenu.css">
    <!-- All min css -->
    <link rel="stylesheet" href="/themes/frontend/assets/css/all.min.css">
    <!-- Swiper bundle min css -->
    <link rel="stylesheet" href="/themes/frontend/assets/css/swiper-bundle.min.css">
    <!-- Magnigic popup css -->
    <link rel="stylesheet" href="/themes/frontend/assets/css/magnific-popup.css">
    <!-- Animate css -->
    <link rel="stylesheet" href="/themes/frontend/assets/css/animate.css">
    <!-- Nice select css -->
    <link rel="stylesheet" href="/themes/frontend/assets/css/nice-select.css">
    <!-- Style css -->
    <link rel="stylesheet" href="/themes/frontend/assets/css/style.css">
</head>

<body>

    <!-- Preloader area start -->
    <div id="loading">
        <div id="loading-center">
            <div id="loading-center-absolute">
                <div class="loading-icon text-center d-flex flex-column align-items-center justify-content-center">
                    <img class="loading-logo" src="<?php echo get_logo_url(); ?>" alt="icon">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader area end -->

   
    <!-- Header area start here -->
    <header class="header-area">
        <div class="container">
            <div class="header__main">
                <a href="index.html" class="logo">
                    <img src="<?php echo get_logo_url(); ?>" alt="logo">
                </a>
                <div class="main-menu">
                    <nav>
                        <ul>
                            <li class="has-megamenu">
                                <a href="<?php echo base_url()?>">Home</a>
                                
                            </li>
                            <li><a href="<?php echo base_url('administration')?>">Administration</a></li>

                            <li>
                                <a href="<?php echo base_url('priest')?>">Priests</a>
                                
                            </li>
                            <li>
                            <a href="<?php echo base_url('parish')?>">Parish</a>
                               
                            </li>
                            
                            <li>
                            <a href="<?php echo base_url('commission')?>">Commission</a>
                                
                            </li>
                            <li>
                            
                                <a href="#0">More <svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 -960 960 960" width="24"><path d="M480-360 280-560h400L480-360Z"/></svg></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a href="<?php echo base_url('posts')?>">posts</a>
                                    </li>
                                    <li>
                                        <a href="<?php echo base_url('posts')?>">News & Events</a>
                                    </li>
                                    <li>
                                        <a href="<?php echo base_url('snapshots')?>">Gallery</a>
                                    </li>
                                    <li>
                                        <a href="<?php echo base_url('pages/history')?>">History</a>                                        
                                    </li>
                                </ul>
                            </li>
                            <li>
                            <a href="<?php echo base_url('pages/contact')?>">Contact</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- <div class="btn-two d-none d-lg-inline-block">
                    <span class=" btn-circle">
                    </span>
                    <a href="cause-single.html" class="btn-inner">
                        <span class="btn-text">
                            DONATE NOW
                        </span>
                    </a>
                </div> -->
                <div class="bars d-block d-lg-none">
                    <i id="openButton" class="fa-solid fa-bars"></i>
                </div>
            </div>
        </div>
    </header>
    <!-- Header area end here -->

    <!-- Sidebar area start here -->
    <div id="targetElement" class="sidebar-area sidebar__hide">
        <div class="sidebar__overlay"></div>
        <a href="index.html" class="logo mb-40">
            <img src="<?php echo base_url('themes/default/images/logo.png?1234'); ?>" alt="logo">
        </a>
        <div class="mobile-menu overflow-hidden"></div>
        <ul class="info pt-40">
            <li><i class="fa-solid primary-color fa-location-dot"></i> <a href="#0">example@example.com</a>
            </li>
            <li class="py-2"><i class="fa-solid primary-color fa-phone-volume"></i> <a
                    href="tel:+208-6666-0112">+208-6666-0112</a>
            </li>
            <li><i class="fa-solid primary-color fa-paper-plane"></i> <a href="#0">info@example.com</a></li>
        </ul>
        <div class="social-icon mt-20">
            <a href="#0"><i class="fa-brands fa-facebook-f"></i></a>
            <a href="#0"><i class="fa-brands fa-twitter"></i></a>
            <a href="#0"><i class="fa-brands fa-linkedin-in"></i></a>
            <a href="#0"><i class="fa-brands fa-pinterest-p"></i></a>
        </div>
        <button id="closeButton" class="text-white"><i class="fa-solid fa-xmark"></i></button>
    </div>
    <!-- Sidebar area end here -->

    <main>
    <?php if(!empty($pageName)){
   echo view($pageName);
  }else{

    echo "page missing";
  }?> 
    </main>

    <!-- Footer area start here -->
    <footer class="footer-area secondary-bg overflow-hidden">
        <div class="footer__main-wrp">
            <div class="footer__shape-left wow slideInLeft" data-wow-delay="200ms" data-wow-duration="1500ms">
                <img class="footer__shape__animation" src="/themes/frontend/assets/images/shape/footer-shape-left.png" alt="shape">
            </div>
            <div class="footer__shape-right wow slideInRight" data-wow-delay="400ms" data-wow-duration="1500ms">
                <img class="footer__shape__animation-right" src="/themes/frontend/assets/images/shape/footer-shape-right.png"
                    alt="shape">
            </div>
            <div class="container">
                <div class="footer__wrp pt-120 pb-120">
                    <div class="row g-4 justify-content-between">
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">
                            <div class="footer__item">
                                <a href="index.html" class="logo mb-40">
                                    <img src="<?php echo base_url('themes/default/images/logo.png?1234'); ?>" alt="image">
                                </a>
                                <p class="text-white">Phasellus ultricies aliquam volutpat
                                    ullamcorper laoreet neque, a lacinia
                                    curabitur lacinia mollis</p>
                                <div class="btn-one mt-40">
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
                        <div class="col-lg-2 col-sm-6 wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                            <div class="footer__item">
                                <h3 class="title mb-40 text-white">Quick Links</h3>
                                <ul class="link">
                                    <li class="mb-3">
                                        <a href="<?php echo base_url('administration')?>"><i class="fa-light fa-angles-right me-2"></i> Administration</a>
                                    </li>
                                    <li class="mb-3">
                                        <a href="cause.html"><i class="fa-light fa-angles-right me-2"></i> Our
                                            Causes</a>
                                    </li>
                                    <li class="mb-3">
                                        <a href="event.html"><i class="fa-light fa-angles-right me-2"></i> Upcoming
                                            Event</a>
                                    </li>
                                    <li class="mb-3">
                                        <a href="blog.html"><i class="fa-light fa-angles-right me-2"></i> Latest
                                            Blog</a>
                                    </li>
                                    <li>
                                        <a href="contact.html"><i class="fa-light fa-angles-right me-2"></i> Contact
                                            Us</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="400ms" data-wow-duration="1500ms">
                            <div class="footer__item">
                                <h3 class="title mb-40 text-white">Latest Post</h3>
                                <ul class="post">
                                    <li class="mb-3">
                                        <div class="image">
                                            <img src="/themes/frontend/assets/images/footer/footer-blog1.png" alt="image">
                                        </div>
                                        <div class="con"><span>22, Nov 2023</span>
                                            <a href="blog-single.html">
                                                Provide Healthy Impoverished..
                                            </a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="image">
                                            <img src="/themes/frontend/assets/images/footer/footer-blog2.png" alt="image">
                                        </div>
                                        <div class="con"><span>18, Nov 2023</span>
                                            <a href="blog-single.html">
                                                Rebecca’s New <br>
                                                Album..
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="600ms" data-wow-duration="1500ms">
                            <div class="footer__item">
                                <h3 class="title mb-40 text-white">Contact Info</h3>
                                <ul class="link info">
                                    <li class="mb-3">
                                        <a href="tel:+8555-2546-2566"><i
                                                class="fa-solid fa-phone me-1 primary-color"></i>
                                            +8
                                            555-2546-2566</a>
                                    </li>
                                    <li class="mb-3">
                                        <a href="#0"><i class="fa-sharp fa-solid fa-envelope me-1 primary-color"></i>
                                            info@example.com</a>
                                    </li>
                                    <li>
                                        <a href="#0"><i class="fa-solid fa-location-dot me-1 primary-color"></i> 3891
                                            Ranchview California
                                            62639</a>
                                    </li>
                                </ul>
                                <div class="social-icon mt-30">
                                    <a href="#0"><i class="fa-brands fa-facebook-f"></i></a>
                                    <a class="active" href="#0"><i class="fa-brands fa-instagram"></i></a>
                                    <a href="#0"><i class="fa-brands fa-linkedin-in"></i></a>
                                    <a href="#0"><i class="fa-brands fa-pinterest-p"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer__copytext">
            <p class="wow fadeInDown" data-wow-delay="400ms" data-wow-duration="1500ms">&copy; All Copyright 2023 by <a
                    href="#0" class="text-white primary-hover">Sadaka</a></p>
        </div>
    </footer>
    <!-- Footer area end here -->

    <!-- Back to top area start here -->
    <div class="scroll-up">
        <svg class="scroll-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
            <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
        </svg>
    </div>
    <!-- Back to top area end here -->

    <!-- Jquery 3. 7. 1 Min Js -->
    <script src="/themes/frontend/assets/js/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap min Js -->
    <script src="/themes/frontend/assets/js/bootstrap.min.js"></script>
    <!-- Mean menu Js -->
    <script src="/themes/frontend/assets/js/meanmenu.js"></script>
    <!-- Swiper bundle min Js -->
    <script src="/themes/frontend/assets/js/swiper-bundle.min.js"></script>
    <!-- Counterup min Js -->
    <script src="/themes/frontend/assets/js/jquery.counterup.min.js"></script>
    <!-- Wow min Js -->
    <script src="/themes/frontend/assets/js/wow.min.js"></script>
    <!-- Magnific popup min Js -->
    <script src="/themes/frontend/assets/js/magnific-popup.min.js"></script>
    <!-- Nice select min Js -->
    <script src="/themes/frontend/assets/js/nice-select.min.js"></script>
    <!-- Isotope pkgd min Js -->
    <!-- <script src="/themes/frontend/assets/js/isotope.pkgd.min.html"></script> -->
    <!-- Waypoints Js -->
    <script src="/themes/frontend/assets/js/jquery.waypoints.js"></script>
    <!-- Script Js -->
    <script src="/themes/frontend/assets/js/script.js"></script>
</body>
</html>