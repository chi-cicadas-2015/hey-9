$(document).ready(function() {
  $(".new_convo_form").on("submit", ".new_direct_conversation", function(event) {
    event.preventDefault();

    var $newConvo = $(this);
    var convoData = $(this).serialize();
    $.ajax({
      url: $newConvo.context.action,
      method: "POST",
      data: convoData,
      success: function(response) {$newConvo.parent().append(response);
        },
      error: function(response) {
        $newConvo.append("<h3>Ooops, that failed for some reason.</h3>");}
    })
      .done(function(response) {
        $(".new_direct_conversation")[0].reset();
        });
    });
});
