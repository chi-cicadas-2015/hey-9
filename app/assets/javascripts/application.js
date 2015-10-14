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

//= require cloudinary
//= require_tree .
//= require materialize-sprockets
//= require_tree .


$(document).ready(function(){
  $('.button-collapse').sideNav({edge: "left"});
  $('.modal-trigger').leanModal();
  $('.modal-trigger2').leanModal();
  $('.parallax').parallax();
  $('.datepicker').pickadate({selectMonths: true, selectYears: 15});

  $("#location").on("submit", function(event){
    event.preventDefault();
		$.ajax({
			method: "POST",
			url: "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyCxHSsHvEIld84HHYj5nvetfW6cV7gYNAs",
			success: function(response) {
        console.log(response);
        var id = $('#user_id').attr('name');
        console.log(id);
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

    $.ajax({
      method: "PUT",
      url: "/dogs/" + $(this).attr('name'),
      success: function(response) {

      }
    })
  })
  // $("#pet-stores").on("click", function(){
  //   console.log("whatup")


  // });


  // http://api.jquery.com/jQuery.noConflict/
  // var $j = jQuery.noConflict();
  // $("#event_event_start").datepicker({
  //   changeMonth: true,
  //     onSelect: function( selectedDate ) {
  //       $( "#event_event_end" ).datepicker( "option", "minDate", selectedDate );
  //     },
  //     onClose:function(){
  //       $( "#event_event_end" ).datepicker("show");
  //     }
  //   });
  //   $( "#event_event_end" ).datepicker({
  //     changeMonth: true,
  //   });

  // https://github.com/jonthornton/jquery-timepicker
  // $("#event-button").on("click", function(){
  //      var eventLocation = $("#event-map").attr('name');
  //      console.log('yooooooo')
  //     var lat
  //     var lng
  //     $.ajax({
  //       method: "POST",
  //       dataType: 'json',
  //       url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + eventLocation + "&key=AIzaSyDj8b8ELTA9Zq9pW7IY1L4TSUX0PClr06M",
  //       success: function(response) {
  //         lat = response.results[0].geometry.location.lat
  //         lng = response.results[0].geometry.location.lng
  //       $.ajax({
  //         method: "POST",
  //         url: "/events",
  //         data: response,
  //         success: function(response) {
  //             console.log(response)
  //           }
  //         })
  //       }
  //     })
  // })

})

