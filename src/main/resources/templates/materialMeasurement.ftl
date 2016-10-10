<html>
<head><title>Quantity</title>

<link href="/css/main.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
<script type="text/javascript" src="/js/script.js" />"></script>   

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html, body {
  font-family: 'Roboto', sans-serif;
  font-weight: 200;
}
</style>

</head>

<body>

<div class="header">	
	<a href="" class="arrow-return"></a>
	<h1 class="page-title">Select measurements</h1> 	
	<a href="/initial.html" class="home-btn"></a>	
										   
</div>

<div class="content" id="content">
 	<form name="enterForm" onsubmit="return Validate(this)" method="post" action="/materialMeasurement" enctype="multipart/form-data">
 	
	<div id="enter_form">
		
    <input type="text" id="result" class="result" onkeypress='return event.charCode >= 48 && event.charCode <= 57 || event.charCode == 46'>  
        
    <div class="properties_btn">
	<#list materialTypeMeasurementProperties as prop>
	  	<input type="button" class="text_btn property" id=${prop.id} value="${prop.description}">	  	
    </#list>
	</div>
    
    <div class="properties_numbers">
    
		<span class="nbr_btn"> 7 </span>
		<span class="nbr_btn"> 8 </span>
		<span class="nbr_btn"> 9 </span>
    
		<span class="nbr_btn"> 4 </span>    
    	<span class="nbr_btn"> 5 </span>
    	<span class="nbr_btn"> 6 </span>
    
    	<span class="nbr_btn"> 1 </span>
    	<span class="nbr_btn"> 2 </span>    
    	<span class="nbr_btn"> 3 </span>
    
    </div>
        	
	<span class="nbr_btn two_size_btn"> 0 </span>
    <span class="nbr_btn"> . </span> 
                 
    <div class="properties_right"> 
    
    <input type="button" class="text_btn" id="enter" value="Enter">
    <input type="button" class="text_btn" id="view" value="View">
    <input type="reset" class="text_btn" id="clear" value="Clear">
    <input type="submit" class="text_btn" value="Submit" value="Submit" />    

	</div>

  </div>
 	  </form> 
</div>  
</body>
</html>  