<html>
<head><title>Materials</title>

<link href="/css/main.css" rel="stylesheet"/>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js">

   <script>
  $( function() {
    $( "#datepicker" ).datepicker({dateFormat: 'dd-mm-yy'});
  } );
  </script>
  
 </head> 
<body>



  <legend>Add Job Details</legend>
 <form id="job_entry" action="/api/v1/jobEntry" method="POST">
	 
	<div class="row">
		<div class='col-sm-6'>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><span><i class="glyphicon glyphicon-calendar"></i></span></span>
					<input class="form-control" name="date" type="date" value="" id="example-date-input">
				</div>
			</div>
		</div>
	</div>
	
    <div class="form-group  input-group">
     	<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
     	<input type="text" class="form-control" name="jobDescription" id="jobDescription" placeholder="Job Description">
    </div>
   <div class="form-group  input-group">
     	<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
     	<select name="customer_id" class="form-control" id="customerDD">
     		<option value="" selected="selected">Select a customer</option>
     		<#list customers as customer>
     			<option value=${customer.id}>${customer.name}</option>
     		</#list>
     	</select>
    </div>
	<div class="form-group input-group">
     	<span class="input-group-addon"><i class="glyphicon glyphicon-th-list"></i></span>
     	<textarea class="form-control" name="notes" rows="5" id="notes" placeholder="Add job notes here"></textarea>
 	</div>
 	<div class="form-group input-group">
 	<button type="submit" class="btn-primary">Submit</button>
 	</div>
 </form>
 
    
    

</body>
</html>