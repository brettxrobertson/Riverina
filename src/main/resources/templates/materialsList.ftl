<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Materials List</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Riverina css -->
    <link href="/css/mycss.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
       <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script> 
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap-editable/css/bootstrap-editable.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap-editable/js/bootstrap-editable.js"></script>
    
    <script>
    //turn to inline mode
		$.fn.editable.defaults.mode = 'inline';
		
		
		
		$(document).ready(function() {
   			 $('.editable').editable({

   				 success: function(response, newValue) {
        			if(response.status == 'error') return response.msg; //msg will be shown in editable form
        			location.reload();
   			 }
		});
   			
        
		});
		
    </script>
    
<table class="table table-striped">
<h1>Materials List</h1>
  <thead>
  	<th>Type</th>
  	<th>Description</th>
  	<th>Cost Price</th>
  	<th>Markup %</th>
  	<th>Sale Price</th>
  	</thead>
  	<tbody>
  	<#list materials as m>
  	
    <tr>
      <td class="col-md-3">${m.mtDescription!}</td>
      <td class="col-md-3"><a href="#" class="editable" id="description" data-type="text" data-pk="${m.id}" data-url="/api/v1/updateMaterial" data-title="Enter description">${m.description!}</a></td>
      <td class="col-md-3"><a href="#" class="editable" id="cost_price" data-type="text" data-pk="${m.id}" data-url="/api/v1/updateMaterial" data-title="Enter Cost price">#{m.cost_price!?number; m2M2}</a></td>
	  <td class="col-md-3"><a href="#" class="editable" id="markup_percent" data-type="text" data-pk="${m.id}" data-url="/api/v1/updateMaterial" data-title="Enter Markup">${m.markup_percent!}</a></td>

     

      <td class="col-md-2">#{m.sale_price!?number; m2M2}</td>
    </tr>
   </#list>  
  	
  	</tbody>
</table>
</body>
</html>