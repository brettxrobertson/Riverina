window.onload = function() {
	var result = document.querySelectorAll('.result')[0];
	buttons = document.getElementsByTagName('span');
	property = document.getElementById("view");
	properties = document.getElementsByClassName("property");
	document.getElementsByClassName("property")[0].className += " focus";
	clear = document.getElementById("clear");
	enter = document.getElementById("enter");
	submit = document.getElementById("submit");
	materialTypeMeasurementProperties = new Array();

	for (var i = 0; i < buttons.length; i += 1) {
		buttons[i].addEventListener("click", addValue(i));
	}
	;

	for (var i = 0; i < properties.length; i += 1) {
		properties[i].addEventListener("click", setProperty(i));
		materialTypeMeasurementProperties.push({
			'propertyDescription' : properties[i].defaultValue,
			'propertyId' : properties[i].id,
			'propertyValue' : ''
		});
	}
	;

	clear.onclick = function() {
		result.value = '';
		for (var i = 0; i < materialTypeMeasurementProperties.length; i++) {
			materialTypeMeasurementProperties[i].propertyValue = "";
		}
	};

	enter.onclick = function() {
		for (var i = 0; i < materialTypeMeasurementProperties.length; i++) {
			if (materialTypeMeasurementProperties[i].propertyDescription == document
					.getElementsByClassName("focus")[0].value) {
				materialTypeMeasurementProperties[i].propertyValue = document
						.getElementById('result').value;
			}
		}
		;

		result.value = '';
		$(".focus").removeClass("focus").next().addClass("focus");
		viewResult();
	};

	viewResult = function() {
		document.getElementById('totalResult').value = '';
		for (i in materialTypeMeasurementProperties) {
			if (materialTypeMeasurementProperties[i].propertyValue != "") {
				document.getElementById('totalResult').value += materialTypeMeasurementProperties[i].propertyValue;
				if (i < materialTypeMeasurementProperties.length - 1) {
					document.getElementById('totalResult').value += ' x ';
				}
			}
		}
		for (var i = 0; i < materialTypeMeasurementProperties.length; i += 1) {
			if ($(".properties_btn .text_btn").hasClass("focus")
					&& materialTypeMeasurementProperties[i].propertyDescription == document
							.getElementsByClassName("focus")[0].value) {
				document.getElementById('result').value = materialTypeMeasurementProperties[i].propertyValue;
			}
		}
	};

	function addValue(i) {
		if ($(".properties_btn .text_btn").hasClass("focus")) {
			return function() {
				document.getElementById('result').value += buttons[i].innerText;
			}
		}
	}
	;

	function setProperty(i) {
		return function() {
			document.getElementById('result').classList.remove("view");
			for (var i = 0; i < properties.length; i += 1) {
				properties[i].classList.remove("focus");
			}
			this.className += " focus";
			result.value = '';
			for (var i = 0; i < materialTypeMeasurementProperties.length; i += 1) {
				if (materialTypeMeasurementProperties[i].propertyDescription == document
						.getElementsByClassName("focus")[0].value) {
					document.getElementById('result').value = materialTypeMeasurementProperties[i].propertyValue;
				}
			}
			viewResult();
		}
	}

	submit.onclick = function() {
		var valid = false;
		for (var i = 0; i < materialTypeMeasurementProperties.length; i += 1) {
			if (materialTypeMeasurementProperties[i].propertyValue != "") {
				valid = true;
			} else
				valid = false;
		}
		;
		if (properties.length != materialTypeMeasurementProperties.length) {
			valid = false;
		}
		;
		if (valid) {
			
			$('#postResult').val(JSON.stringify(materialTypeMeasurementProperties));
			
			$('#enterForm').submit();
			//$.post('/materialMeasurement', JSON.stringify(materialTypeMeasurementProperties), function() { window.location.href = 'page'.php' });
			
			
			/*
			$.ajax({
				type : "POST",
				url : '/materialMeasurement',
				dataType : "json",
				data : JSON.stringify(materialTypeMeasurementProperties),
				success : function(response) {
					alert("Im success" + response.responseText);
				},
				error : function(response) {
					alert("error");
					window.location = "http://localhost:4567/jobs";
				},
				onComplete : function(response) {
					alert("Im complete" + response.responseText);
				},

			});*/
		}
	}
};