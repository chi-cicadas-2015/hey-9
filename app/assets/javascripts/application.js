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

function CoordMapType(tileSize) {
  this.tileSize = tileSize;
}

CoordMapType.prototype.getTile = function(coord, zoom, ownerDocument) {
  var div = ownerDocument.createElement('div');
  div.innerHTML = coord;
  div.style.width = this.tileSize.width + 'px';
  div.style.height = this.tileSize.height + 'px';
  div.style.fontSize = '10';
  div.style.borderStyle = 'solid';
  div.style.borderWidth = '1px';
  div.style.borderColor = '#AAAAAA';
  return div;
};

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: {lat: 41.850, lng: -87.650}
  });

  // Insert this overlay map type as the first overlay map type at
  // position 0. Note that all overlay map types appear on top of
  // their parent base map.
  map.overlayMapTypes.insertAt(
      0, new CoordMapType(new google.maps.Size(256, 256)));
}
 

