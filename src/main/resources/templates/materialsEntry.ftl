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
		window.onload=function(){
			var addMeasurementBtn = document.getElementById('addMeasurementbtn');
			
			//Remove button
			$(document).on('click', '#remMeasurementbtn', function () {
    			$(this).parent('div').remove();
			});
			
			if(addMeasurementBtn){
				addMeasurementBtn.addEventListener('click', function() {
				
					var selectedText = $('#measurement_properties option:selected').text();
					var selectedVal = $('#measurement_properties option:selected').val();
					
    				var newInput = $(
    					"<div class='form-group input-group'>\
    						<span class='input-group-addon'><i class='glyphicon glyphicon-text-background'></i></span>\
    						<input type='text' class='form-control' name='mprop_" + selectedVal +"' placeholder='Material "+ selectedText + "' id='mprop' />\
    					<button type='button' class='btn-primary btn-group' id='remMeasurementbtn'>Remove</button> \
    					 </div>");
    				$('#addMeasurements').after(newInput);
				}, false);
			}
		}
		
		
		
		</script>
  
 	</head> 
	<body>
		<legend>Add Materials Details</legend>
  
		<form id="materialsEntry" name="materialsEntry" method="post" action="/api/v1/materialsEntry">

			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="description" placeholder="Material Description" id="description" />
			</div>

			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-tags"></i></span>
				<select name="materialTypeID" class="form-control" id="materialTypeDD">
					<option value="" selected="selected">Select a type</option>
     				<#list materialTypes as type>
     					<option value=${type.id}>${type.description}</option>
					</#list>
				</select>
			</div>
			
			<div id="addMeasurements" class="form-group  input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-tags"></i></span>
				<select name="measurement_properties_id" class="btn-group" id="measurement_properties">
					<option value="10" selected="selected">Quantity</option>
     				<#list measurementProperties as prop>
     					<option value=${prop.id}>${prop.description}</option>
					</#list>
				</select>
				<button type="button" class="btn-primary" id="addMeasurementbtn">Add</button>
				
			</div>
			
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="costPrice" placeholder="Cost Price" id="costPrice" />
			</div>

			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="markUp" placeholder="Markup %" id="markup" />
			</div>

			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="qtyOnHand" placeholder="Quantity on Hand" id="qty" />
			</div>
		
			<div class="form-group input-group">
				<button type="submit" class="btn-primary">Submit</button>
			</div>
		</form>    
	</body>
</html>