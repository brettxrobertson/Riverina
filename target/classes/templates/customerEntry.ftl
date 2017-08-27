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
		<legend>Add Customer Details</legend>
  
		<form id="customerEntry" name="customerEntry" method="post" action="/api/v1/customerEntry">

			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="name" placeholder="Customer Name" id="name" />
			</div>
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="address1" placeholder="Address 1" id="address1" />
			</div>
			
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="address2" placeholder="Address 2" id="address2" />
			</div>
			
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="address3" placeholder="Address 3" id="address3" />
			</div>
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="suburb" placeholder="Suburb" id="suburb" />
			</div>
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="state" placeholder="State" id="state" />
			</div>
			<div class="form-group  input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
				<input type="text" class="form-control" name="postcode" placeholder="Postcode" id="postcode" />
			</div>									
			<div class="form-group input-group">
				<button type="submit" class="btn-primary">Submit</button>
			</div>
		
			
		</form>    
	</body>
</html>