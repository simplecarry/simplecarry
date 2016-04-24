var scheme = if location.protocol == 'http:' then "ws://" else "wss://";
var uri    = scheme + window.document.location.host + "/";
window.ws  = new WebSocket(uri);

window.ws.onmessage = function (message) {
  console.log("received: ", message);
  data = JSON.parse(message.data);
  switch (data.event) {
    // append the new message html content
    case 'message_create': 
      $(data.content).hide().appendTo('.messages').slideDown();
      break;

    // remove the deleted message
    case 'message_delete':
      $('.messages').find(data.content).slideUp(300, -> $(this).remove());
      break;
    
    default:
      console.log("unknown event", data.event);
  }    
};

// see: https://github.com/rails/jquery-ujs/wiki/ajax
function setupForm() {
  $("form#new_message").on('ajax:success', function (event, data, success, xhr) {
    $('input#message_content').val('');
  }).on('ajax:error', function (event, xhr, status, error) {
    // this is useful for network issues or server errors
    // e.g. try using message.save!
    alert("Couldn't send the message. Try again later.");
  });

  $('.message_delete').on('ajax:before', function () {
    $(this).parent().slideUp('slow');
  }).on('ajax:error', function (event, xhr, status, error) {
    console.log("Error: ", error);
    $(this).parent().effect('shake');
  });
}

$(document).on("page:change", function () {
  setupForm();
});
