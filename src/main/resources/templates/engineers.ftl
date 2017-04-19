<html>
<head><title>Engineers</title>

<link href="/css/main.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />

<body>

<div class="header">	
	<h1 class="page-title">${userScreenDescription}</h1>	
	<a href="${userScreenHomeLocation}" class="home-btn"></a>										   
</div>

<div class="content" id="content">
  <div class="card-container">
  	 <#list engineers as engineer>
	  	
	  	<div class="card">
	  	<a href="/jobs?sessionId=${engineer.id}" class="button">
	  		<div class="circle"></div>
  				<div class="card-text">
  					<span>${engineer.name} ${engineer.surname}</span>
				</div>
  			</div>
  			</a>
    </#list>
  </div>
    
</div>

<div>
	 <a href="/factoryLogin?page=${backPage}"><div class="footer footer-left">
        <button class="btn btn-left">
  	</div></a>
	 
	 <a href="/factoryLogin?page=${fwdPage}"><div class="footer footer-right">
        <button class="btn btn-right">
  	</div></a>
</div>
  
</body>
</html>  