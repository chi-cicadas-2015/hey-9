$(document).ready(function(){
 // $('.button-collapse').sideNav({
 //      menuWidth: 300, // Default is 240
 //      edge: 'left', // Choose the horizontal origin
 //      closeOnClick: false // Closes side-nav on <a> clicks, useful for Angular/Meteor
 //    }
 //  );

 // $('.button-collapse2').sideNav({
 //      menuWidth: 300, // Default is 240
 //      edge: 'right', // Choose the horizontal origin
 //      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
 //    }
 //  );

var change = function(){
  alert("changed");
}


    $(".button-collapse").sideNav({edge: 'left'});
    $("#right").sideNav({edge: 'right'});


 $('#color-change').on("click", function(event){
    event.preventDefault();
    $('div[class~="yellow"]').removeClass('yellow').addClass('red');
 });
});
