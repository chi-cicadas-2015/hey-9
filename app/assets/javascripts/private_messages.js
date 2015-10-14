$(document).ready(function() {
  $(".container").delegate(".new_private_message", "submit", function(event) {
    event.preventDefault();

    var $newMessage = $(this);
    var messageData = $(this).serialize();
    $.ajax({
      url: $newMessage.context.action,
      method: "POST",
      data: messageData,
      success: function(response) {$newMessage.parent().parent().siblings().append(response);
        },
      error: function(response) {
        $newMessage.append("<h3>Ooops, that failed for some reason.</h3>");}
    })
      .done(function(response) {
        $(".new_private_message").each (function(){
          this.reset();
        });
     });
  });
});

