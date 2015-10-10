// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


var railsEnv = $('body').data('env')
var myLatlng
$(document).ready(function(){
	$("#location").on("click", function(){
		$.ajax({
				method: "POST",
				url: "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyC8_pBC2fS1wrte8fb97qRZ6jevl2NjyKk",
				success: function(response) {
					myLatlng = {lat: response.location.lat, lng: response.location.lng}
					console.log(myLatlng)
				} 
	  	})

  	})

})
	

//  function initMap() {
//   // var myLatlng = {lat: -25.363, lng: 131.044};


// }

 

