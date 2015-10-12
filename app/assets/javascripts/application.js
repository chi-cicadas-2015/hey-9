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
//= require materialize-sprockets
//= require_tree .

var railsEnv = $('body').data('env')
// console.log(railsEnv)
// var myLatlng
$(document).ready(function(){
  $("#location").on("submit", function(event){
    event.preventDefault();
		$.ajax({
				method: "POST",
				url: "https://www.googleapis.com/geolocation/v1/geolocate?key=",
				success: function(response) {
          var id = $('input[type=hidden]').val()
          $.ajax({
            method: "PUT",
            url: "/users/" + id.toString(),
            dataType: "json",
            data: response,
            success: function(response) {

            }
          })
				}
	  	})
    })

  $("#add-friend").on("click", function(event){
    event.preventDefault();
    console.log($(this).attr('name'))
    // console.log($(this))
    $.ajax({
      method: "PUT",
      url: "/dogs/" + $(this).attr('name'),
      success: function(response) {

      }
    })
  })
  });
// });




