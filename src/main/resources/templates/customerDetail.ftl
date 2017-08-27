<html>
	<head>
		<title>Materials Entry</title>

		<link href="/css/main.css" rel="stylesheet"/>
 		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js">
		
		<script>
		$(document).ready(function(){
	$("#customer").submit(function(event){
    event.preventDefault(); //prevent default action 
    var post_url = $(this).attr("action"); //get form action url
    var request_method = $(this).attr("method"); //get form GET/POST method
    var form_data = $(this).serialize(); //Encode form elements for submission
    
    $.ajax({
        url : post_url,
        type: request_method,
        data : form_data
    }).done(function(response){ // 
       
    	$('#server-results').html(response).show().fadeOut(3000, function() {
        $(this).hide();
    });

    });
});
});
</script>
  
 	</head> 
	<body>
		<legend>Customer Details</legend>
  	
  	<form id="customer" name="customerEntry" action="/api/v1/customer" method="PUT">
	<table class="table" id="customerTable">

			<input type="hidden" name="id" value="${customer.id}" />
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="name" value='${customer.name!""}' placeholder='Name' id="name" />
			</div>
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="address1" value='${customer.address1!""}' placeholder='Address1' id="address1" />
			</div>
			
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="address2" value='${customer.address2!""}' placeholder='Address2' id="address2" />
			</div>
			
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="address3" value='${customer.address3!""}' placeholder='Address3' id="address3" />
			</div>
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="suburb" value='${customer.suburb!""}' placeholder='Suburb' id="suburb" />
			</div>
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="state" value='${customer.state!""}' placeholder='State' id="state" />
			</div>
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="postcode" value='${customer.postcode!""}' placeholder='Postcode' id="postcode" />
			</div>									
			<div class="form-group input-group">
				<button type="submit" class="btn-primary">Update</button><div id="server-results"></div>
			</div>
				
		
			</table>
		</form> 

 
</div>	
<div>
<table class="table">		
		<#list helper.getJobsByCustomer() as job>
    		<tr>
      		<td>${job.date}</td>
      		<td><a href="/api/v1/jobSummary/${job.id}">${job.jobName}</a></td>
      
    		</tr>
   		</#list> 
   		</table>  
   		</div>
	</body>
</html>