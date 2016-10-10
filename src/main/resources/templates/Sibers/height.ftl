<html>
<head><title>Height</title>

<link href="resources/css/main.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />

<body>

<div class="header">	
	<a href="" class="arrow-return"></a>
	<h1 class="page-title">Select height</h1>	
	<a href="" class="home-btn"></a>										   
</div>

<div class="content" id="content">
 	<div class="top-container">
 		<span class="top-container-text"> 20  mm</span> 	
 	</div>  
 	
	<div>
 		<#list model["numberButtonList"] as number>	   		
			<div class="middle-btn">
				<span class="middle-btn-text">${number.value}</span>
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