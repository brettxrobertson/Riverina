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
<style>
.zebra:nth-child(odd) {
    background: #e0e0e0;
}

.mehide {
	display: none;
}
</style>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- Include all compiled plugins (below), or include individual files as needed -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap-editable/css/bootstrap-editable.css"
	rel="stylesheet">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap-editable/js/bootstrap-editable.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-confirmation/1.0.5/bootstrap-confirmation.min.js"></script>
</head>
<body>






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
		
		$(function() {
    		$('#toggle-event').change(function() {
     			$('.mehide').toggle();
    		})
  		})
		
		$(function(){
    $('#materialtype').editable({
            
       
        source: [
              
           
        	
           ]
    });
});
		
    </script>
	<script>
    function poster(data)
		{
		
			$.ajax({
 			 	type: "delete",
  				url: "/api/v1/material/" + data,
  				success: function(){
  				
  				location.reload();
  				},
			});
		}
    </script>

	<h1>Materials List</h1>

	<div class="container-fluid">

		<div class="row">
			<div class="col-md-2">Type</div>
			<div class="col-md-2">Description</div>
			<div class="col-md-2">Cost Price</div>
			<div class="col-md-2">Markup %</div>
			<div class="col-md-2">Sale Price</div>


			<div class="col-md-1 btn-group" data-toggle="buttons">

				<input id="toggle-event" type="checkbox" data-toggle="toggle"
					data-on="Delete Enabled" data-off="Delete Disabled"
					data-size="mini">

			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div id="accordion" role="tablist" aria-multiselectable="true">
			<#list material_types as type>
			<div class="card">
				<div class="card-header" role="tab" id="heading-${type.id}">
					<h5 class="mb-0">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse-${type.id}" aria-expanded="true"
							aria-controls="collapse-${type.id}">
							<div class="row">
								<div class="col-md-11 btn btn-secondary btn-sm">${type.description}</div>
							</div>
						</a>
					</h5>
				</div>
				
				<div id="collapse-${type.id}" class="collapse show" role="tabpanel"
					aria-labelledby="heading-${type.id}">
					<div class="card-block">
					<#list materials as m> 
					<#if type.id == m.mtId>
						<div class="row zebra mh-100">
							<div class="col-md-2">
								<a href="#" id="material_types_id"
									data-url="/api/v1/updateMaterial" data-type="select"
									data-pk="${m.id}" data-value=""
									data-source="[<#list material_types as mt>{value: '${mt.id}',text: '${mt.description}'},</#list>]"
									data-title="Select type" class="editable editable-click"
									data-original-title="" title="">${m.mtDescription!}</a>
							</div>
							<div class="col-md-2">
								<a href="#" class="editable" id="description" data-type="text"
									data-pk="${m.id}" data-url="/api/v1/updateMaterial"
									data-title="Enter description">${m.description!}</a>
							</div>
							<div class="col-md-2">
								<a href="#" class="editable" id="cost_price" data-type="text"
									data-pk="${m.id}" data-url="/api/v1/updateMaterial"
									data-title="Enter Cost price">#{m.cost_price!?number; m2M2}</a>
							</div>
							<div class="col-md-2">
								<a href="#" class="editable" id="markup_percent"
									data-type="text" data-pk="${m.id}"
									data-url="/api/v1/updateMaterial" data-title="Enter Markup">${m.markup_percent!}</a>
							</div>
							<div class="col-md-2">#{m.sale_price!?number; m2M2}</div>
							<div class="col-md-1" id="${m.id}_collapse">
								<div class="mehide">
									<a href="#" id="delete_btn" class="btn btn-danger btn-sm"
										onClick="poster(${m.id});">Delete</a>
								</div>
							</div>
						</div>
						</#if>
						</#list>
					</div>
					</div>
			</div>
			</#list>

		</div>
	</div>
</html>