$(document).ready(function () {
  $('#filter-by').on('change', function () {
    $(this).parents('form').trigger('submit');
  })
});