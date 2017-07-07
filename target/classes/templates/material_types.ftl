<html>
<head><title>Categories</title>

<link href="/css/main.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />

<body>

<div class="header">	
	<a href="javascript:history.back()" class="arrow-return"></a>
	<h1 class="page-title">${userScreenDescription}</h1>	
	<a href="${userScreenHomeLocation}" class="home-btn"></a>										   
</div>

<div class="content" id="content">
  <div class="card-container">
  	 <#list materialTypes as category>
  	 <a /href='/materialTypes/${category.id}' class='button'>
	  	<div class="card">	  		
  				<div class="category-card-text">
  					<span>${category.description}</span>
				</div>				
  			</div>
    </#list>
  </div>
    
</div>

<div> 
	 <a href="/materialTypes?page=${backPage}"><div class="footer footer-left">
        <button class="btn btn-left">
  	</div></a>
	 
	 <a href="/materialTypes?page=${fwdPage}"><div class="footer footer-right">
        <button class="btn btn-right">
  	</div></a>
</div>
  
</body>
</html>  