<html>
<head><title>Engineers</title>

<link href="resources/css/main.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />

<body>

<div class="header">	
	<h1 class="page-title">${userScreen.description}</h1>	
	<a href="${userScreen.homeLocation}" class="home-btn"></a>										   
</div>

<div class="content" id="content">
  <div class="card-container">
  	 <#list model["engineers"] as engineer>
	  	<div class="card">
	  		<div class="circle"></div>
  				<div class="card-text">
  					<span>${engineer.name} ${engineer.surname}</span>
				</div>
  			</div>
    </#list>
  </div>
    
</div>

<div>
	 <a href="#"><div class="footer footer-left">
        <button class="btn btn-left">
  	</div></a>
	 
	 <a href="#"><div class="footer footer-right">
        <button class="btn btn-right">
  	</div></a>
</div>
  
</body>
</html>  