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
// $(document).ready(function(){
// 	$.cloudinary.config({ cloud_name: 'dj3bgluad', api_key: '255366543837721'})

//     $('#fileupload').fileupload({
//         dataType: 'json',

//         add: function (e, data) {
//         	console.log(data);
//         	console.log("hey");
//             data.context = $('<button/>').text('Upload')
//                 .appendTo(document.body)
//                 .click(function () {
//                     data.context = $('<p/>').text('Uploading...').replaceAll($(this));
//                     data.submit();
//                 });
//         },
//         done: function (e, data) {
//             data.context.text('Upload finished.');
//         }
//     });



// 	var image = $.cloudinary.image(response.public_id + '.jpg', { width: 120, height: 80, crop: 'fill' });
// 	console.log(image)

// 	})
