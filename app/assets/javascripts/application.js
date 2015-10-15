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
  $('.modal-trigger3').leanModal();
  $('.modal-trigger4').leanModal();

  $('.parallax').parallax();
  $('.datepicker').pickadate({selectMonths: true, selectYears: 15});
  changeWeather("#weather-card");
  changeWeather("#weather-card2");
  $('.fixed-action-btn').openFAB();


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
})

function changeWeather(card){
  var inner = $(card);
  var summary = $(inner).text();

  if(summary.includes("Clear")){
    $(inner).addClass("light-blue lighten-3");
    Materialize.fadeInImage(inner);
  } else if (summary.includes("Sunny")){
    $(inner).addClass("yellow");
    Materialize.fadeInImage(inner);
  } else if (summary.includes("Cloudy")){
    $(inner).addClass("grey lighten-1");
    Materialize.fadeInImage(inner);
  } else if (summary.includes("Rain")){
    $(inner).addClass("grey");
    Materialize.fadeInImage(inner);
  } else if (summary.includes("Storm")){
    $(inner).addClass("grey darken-1");
    Materialize.fadeInImage(inner);
  }
};

