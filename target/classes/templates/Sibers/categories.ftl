<html>
<head><title>Categories</title>

<link href="resources/css/main.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />

<body>

<div class="header">	
	<a href="" class="arrow-return"></a>
	<h1 class="page-title">Select a product type</h1>	
	<a href="" class="home-btn"></a>										   
</div>

<div class="content" id="content">
  <div class="card-container">
  	 <#list model["categoryList"] as category>
	  	<div class="card">	  		
  				<div class="category-card-text">
  					<span>${category.name}</span>
				</div>				
  			</div>
    </#list>
  </div>
    
</div>

<div> 
	 <a href="#"><div class="footer footer-left">
        <button class="btn btn-left-grey">
  	</div></a>
	 
	 <a href="#"><div class="footer footer-right">
        <button class="btn btn-right-grey">
  	</div></a>
</div>
  
</body>
</html>  