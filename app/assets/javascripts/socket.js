var scheme = location.protocol == 'http:' ? "ws://" : "wss://";
var uri    = scheme + window.document.location.host + "/";
window.ws  = new WebSocket(uri);

console.log("FU");

window.ws.onmessage = function (message) {
  console.log("received: ", message);
  data = JSON.parse(message.data);
  switch (data.event) {
    // append the new comment html content
    case 'comment_create': 
      addComment(data);
      break;

    default:
      console.log("unknown event", data.event);
  }    
};

function addComment(data) {
  console.log('addComment');
  $(data.content).hide().appendTo('.commentList').slideDown();
}

// see: https://github.com/rails/jquery-ujs/wiki/ajax
// function setupForm() {
//   $("form#new_comment").on('ajax:success', function (event, data, success, xhr) {
//     $('input#comment_content').val('');
//   }).on('ajax:error', function (event, xhr, status, error) {
//     // this is useful for network issues or server errors
//     // e.g. try using message.save!
//     alert("Couldn't send the message. Try again later.");
//   });
// }

// $(document).on("page:change", function () {
//   setupForm();
// });
