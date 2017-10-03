<html>
<head><title>Job Summary</title>

<link href="/css/main.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
<script type="text/javascript" src="/js/script.js" />"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>  
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
	<h1 class="page-title">${userScreenDescription}</h1> 	
	<a href="/" class="home-btn"></a>										   
</div>

<div>
<table class="table">
  <thead>
    <tr>
    <th>Customer</th><th>Job</th><th>Date</th><th>Status</th><th>User</th>
    </tr>
     <#list jobs as job>
    <tr>
    <td>${job.customer_name}</td>
    <td>${job.job_name}</td>
    <td>${job.date}</td>
    <td>${job.job_status}</td>
    <td>${job.user_name}</td>
    </tr>
    </#list>
  </thead>
 </table>
</div>	

<div>
<table class="table">
  <thead>
    <tr>
      
      <th>Date</th>
      <th>User</th>
      <th>Material</th>
      <th>Cost Price</th>
      <th>Markup</th>
      <th>Property</th>
      <!-- <th>Cost Value</th> -->
      <th>Sale Value</th>
    </tr>
  </thead>
  <tbody>
  <#assign cost_sum=0/>
  <#assign sale_sum=0/>
	 <#list rows as row>
		<#assign cost_sum = cost_sum + row.cost/>
		<#assign sale_sum = sale_sum + row.sale_value/>
   		<tr>
   			<td>${row.date}</td>
   			<td>${row.name}</td>
   			<td>${row.material_desc}</td>
   			<td>${row.cost_price}</td>
   			<td>${row.markup_percent}</td>
   			<td>
   			<#list row.measurements as measurement>
   				${measurement.description} = ${measurement.measurement}<br/>
   			</#list>
   			</td>
   			<!-- <td>${row.cost?string.currency}</td> -->
   			<td>${row.sale_value?string.currency}</td>
   		</tr>
   		
	</#list>
	<tr>
		<td colspan="6"/>
		<!-- <td>${cost_sum?string.currency}</td> -->
		<td>${sale_sum?string.currency}</td>
	</tr>
	</tbody>
	</table>
</div>
  
</body>
</html>  

