<html>
<head><title>Materials Types Entry</title>

<link href="/css/main.css" rel="stylesheet"/>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js">

 
</head> 
<body>



  <legend>Add Material Types</legend>
 <form id="material_type_entry" action="/api/v1/materialTypes" method="POST">
	 
	
    <div class="form-group  input-group">
     	<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
     	<input type="text" class="form-control" name="description" id="jobDescription" placeholder="Type description">
    </div>
   <div class="form-group  input-group">
     	<span class="input-group-addon"><i class="glyphicon glyphicon-chevron-up"></i></span>
     	<select name="parent_types_id" class="form-control" id="customerDD">
     		<option value="" selected="selected">Select Parent Type</option>
     		<#list parent_material_types as material_type>
     			<option value=${material_type.id}>${material_type.description}</option>
     		</#list>
     	</select>
    </div>

 	<button type="submit" class="btn-primary">Submit</button>
 	</div>
 </form>
 
    
    

</body>
</html>