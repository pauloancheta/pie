$(document).ready(function() {
  $('.address-div').hide();
  $('.is-admin-checkbox').on('click', function() {
    $('.address-div').fadeIn();
  });
});