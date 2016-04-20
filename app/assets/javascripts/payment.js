$(document).ready(function () {
  $('#deposit-form').on('submit', function () {
    // Grab the form:
    var $form = $(this);
    // Disable the submit button to prevent repeated clicks:
    $('button[type="submit"]').prop('disabled', true);
    // Request a token from Stripe:
    Stripe.card.createToken($form, stripeResponseHandler);
    // Prevent the form from being submitted:
    return false;
  });
});

function stripeResponseHandler(status, response) {
  // Grab the form:
  var $form = $('#deposit-form');

  if (response.error) { // Problem!
    // Show the errors on the form:
    $form.find('.payment-errors').text(response.error.message);
    $('button[type="submit"]').prop('disabled', false); // Re-enable submission

  } else { // Token was created!
    // Get the token ID:
    var token = response.id;

    // Insert the token ID into the form so it gets submitted to the server:
    $form.append($('<input type="hidden" name="stripe_token">').val(token));

    // Submit the form:
    $form.get(0).submit();
  }
}