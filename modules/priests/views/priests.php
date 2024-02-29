
	<?php
		$totSegments = $this->uri->total_segments();
		$uriSegments = $this->uri->segment($totSegments);
		if(!is_numeric($uriSegments) || is_numeric($this->uri->segment(2)))
		{
			$offset = 0;
		} else if(is_numeric($uriSegments)){
			$offset = $this->uri->segment($totSegments);
		}
		
		$limit 	= 12;
	 function slugify($text)
{
  // replace non letter or digits by -
  $text = preg_replace('~[^\pL\d]+~u', '-', $text);

  // transliterate
  // $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);

  // remove unwanted characters
  $text = preg_replace('~[^-\w]+~', '', $text);

  // trim
  $text = trim($text, '-');

  // remove duplicate -
  $text = preg_replace('~-+~', '-', $text);

  // lowercase
  $text = strtolower($text);

  if (empty($text)) {
    return 'n-a';
  }

  return $text;
}
		
	?>
    
	 <style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
	

   <main>
        <!-- Page banner area start here -->
        <section class="banner__inner-page bg-image pt-160 pb-160 bg-image"
            data-background="/themes/frontend/assets/images/banner/banner-inner-page.jpg">
            <div class="container">
                <h2 class="wow fadeInUp" data-wow-delay="00ms" data-wow-duration="1500ms">Priests</h2>
                <div class="breadcrumb-list wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                    <a href="index.html">Home</a><span><i class="fa-regular fa-angles-right mx-2"></i>Priests</span>
                </div>
            </div>
           
        </section>
        <!-- Page banner area end here -->

        <!-- Team area start here -->
        <section class="team-area pt-60 pb-120">
            <div class="container">
            <div class="page-name-block" >
	  
      <div class="d-flex m-4 p-2">
      
      <input type="text" class="form-control serach-btn"  onkeyup="searchkey(this.value)" name="query" placeholder="<?php echo 'Search Priest'//echo phrase('search_user'); ?>"<?php echo ($keywords != null ? ' value="' . $keywords . '"' : 'test'); ?> />
          


        <?php foreach($p_type as $key=>$pType): $pTypeurl = slugify($pType); ?>
        
    <a class="btn btn-link dropdown-toggle filter-content" href="#<?php echo $pTypeurl?>" data-id="<?php echo $key?>"><?php echo $pType ?></a>
        
        
                                  
                                      <?php endforeach;?>
              
      </div>
  </div>
                <div class="row g-4" id="priest-block">
                   
                    
                    
                    
                </div>
            </div>
        </section>
        <!-- Team area end here -->
    </main>

    
	<script>
	var admin_url   = '<?php echo base_url()?>';
   var url        = '';
   var keyword    = null;
   var slug       = '';
    var currentRequest = null;   
    function router () 
    {
      url       = location.hash.slice(1) || '/';
      
      
       	$('#priest-block').html(' <div class="loader"></div>');
     currentRequest =	$.ajax({
                    url: admin_url+'priest',
                    type: "POST",
                    data: {'keyword':keyword,'slug':url},
                     beforeSend : function()    {           
        if(currentRequest != null) {
            currentRequest.abort();
        }
    },
                    success: function(response){
					
					$('#priest-block').html(response)
                    }
                });
		
       
     
    }
    
    function searchkey(serchkey)
    {
      keyword = serchkey;
      router();
    }
   
    window.addEventListener('hashchange', router);
    window.addEventListener('load', router);
  </script>