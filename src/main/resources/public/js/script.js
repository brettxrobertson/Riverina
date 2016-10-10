window.onload = function() {
	var
		buttons = document.getElementsByTagName('span'), result = document.querySelectorAll('.result')[0], 
		clear = document.getElementById("clear");
		view = document.getElementById("view");
		property = document.getElementById("view");
		enter = document.getElementById("enter");
		properties = document.getElementsByClassName("property");
		materialTypeMeasurementProperties = new Array();
		document.getElementById("1").className += " focus";	
		

	for (var i = 0; i < buttons.length; i += 1) {
		buttons[i].addEventListener("click", addValue(i));
	};

	for (var i = 0; i < properties.length; i += 1) {
		properties[i].addEventListener("click", setProperty(i));		
	};	

	clear.onclick = function() {
		result.value = '';		
	};
	
	enter.onclick = function() {		
		if(materialTypeMeasurementProperties.length > 0){
			for (var i = 0; i < materialTypeMeasurementProperties.length; i += 1){
				if(materialTypeMeasurementProperties[i].description != document.getElementsByClassName("focus")[0].value){
					materialTypeMeasurementProperties.push({'description': document.getElementsByClassName("focus")[0].value,  'measurement_properties_id': document.getElementById('result').value});
					break;
				} else {
					if(document.getElementById('result').value != materialTypeMeasurementProperties[i].measurement_properties_id){
						materialTypeMeasurementProperties.splice(i, 1);
						materialTypeMeasurementProperties.push({'description': document.getElementsByClassName("focus")[0].value,  'measurement_properties_id': document.getElementById('result').value});						
					} else {
						document.getElementById('result').value = materialTypeMeasurementProperties[i].measurement_properties_id;
					}
				}				
			} 
			
		} else if(materialTypeMeasurementProperties.length == 0) {
			materialTypeMeasurementProperties.push({'description': document.getElementsByClassName("focus")[0].value,  'measurement_properties_id': document.getElementById('result').value});
		}
		
		result.value = '';
	}
	
	view.onclick = function() {
		result.value = '';
		document.getElementById("result").className += " view";	
		
		for (var i = materialTypeMeasurementProperties.length; i > 0; i -= 1){
			document.getElementById('result').value += ' x ' + materialTypeMeasurementProperties[i -1].measurement_properties_id;	  
		 };
	};

	function addValue(i) {
		return function() {
			document.getElementById('result').value += buttons[i].innerText;			
		};
	};

	function setProperty(i) {	
		return function() {	
			
			document.getElementById('result').classList.remove("view");
			for (var i = 0; i < properties.length; i += 1) {			
				properties[i].classList.remove("focus");
			}
			this.className += " focus";	
			
			result.value = '';
			for (var i = 0; i < materialTypeMeasurementProperties.length; i += 1){				
			if(materialTypeMeasurementProperties[i].description == document.getElementsByClassName("focus")[0].value){		
				document.getElementById('result').value = materialTypeMeasurementProperties[i].measurement_properties_id;
			 } 
			}	
		};
	};
};

function Validate() {
	var valid = false;
	
	for (var i = 0; i < materialTypeMeasurementProperties.length; i += 1){
		if(materialTypeMeasurementProperties[i].measurement_properties_id != "") {
			valid = true;
		} else valid = false;		  
	 };
	
	if(properties.length != materialTypeMeasurementProperties.length) {
		valid = false;	
	};
	return valid;
}
