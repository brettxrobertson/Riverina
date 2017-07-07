<html>
<head><title>Job List</title>

<link href="css/main.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />


<body>

<div class="header">	
	<a href="javascript:history.back()" class="arrow-return"></a>
	<h1 class="page-title">Select a job from the list</h1>	
	<a href="/" class="home-btn"></a>										   
</div>

<div class="content" id="content">
  <div class="card-container">
  	 <#list jobs as job>
	  	<a /href='materialTypes?jobId=${job.id}' class='button'>
	  	<div class="card">	  		
  				<div class="card-text bold">
  					<span>${job.jobName}</span>
				</div>				
  			</div>
    </#list>
  </div>
    
</div>

<div>
	<div class="footer-letter"> 
			<div> 
			<div class="latters one-letter"> <a href="#" class="letter-text one-letter-text"> A </a> </div>
			<div class="latters one-letter"> <a href="#" class="letter-text one-letter-text"> B </a> </div>
			<div class="latters one-letter"> <a href="#" class="letter-text one-letter-text"> C </a> </div>
			<div class="latters two-letter"> <a href="#" class="letter-text two-letter-text"> D - F </a> </div>
			<div class="latters two-letter"> <a href="#" class="letter-text two-letter-text"> G - I </a> </div>
			<div class="latters two-letter"> <a href="#" class="letter-text two-letter-text"> J - L </a> </div>
			<div class="latters two-letter"> <a href="#" class="letter-text two-letter-text"> M - O </a> </div>
			<div class="latters two-letter"> <a href="#" class="letter-text two-letter-text"> P - R </a> </div>
			<div class="latters two-letter"> <a href="#" class="letter-text two-letter-text"> S - V </a> </div>
			<div class="latters two-letter"> <a href="#" class="letter-text two-letter-text"> W - Z </a> </div>			
		</div>
	</div> 
	 <a href="/jobs?page=${backPage}"><div class="footer footer-left">
        <button class="btn btn-left">
  	</div></a>
	 
	 <a href="/jobs?page=${fwdPage}"><div class="footer footer-right">
        <button class="btn btn-right">
  	</div></a>
</div>
  
</body>
</html>  