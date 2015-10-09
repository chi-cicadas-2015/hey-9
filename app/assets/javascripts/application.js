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
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	var railsEnv = $('body').data('env')
	$("#location").on("click", function(){
		$.ajax(
			url: "https://www.googleapis.com/geolocation/v1/geolocate?key=" + railsEnv,
			type: "POST",
			success: function(response) {
				console.log(reponse)
			})
	})
	// window.onload = function() {
	//   var startPos;
	//   var geoSuccess = function(position) {
	//     startPos = position;
	//     document.getElementById('startLat').innerHTML = startPos.coords.latitude;
	//     document.getElementById('startLon').innerHTML = startPos.coords.longitude;
	//   };
	//   navigator.geolocation.getCurrentPosition(geoSuccess);
	// };

})