$(document).ready(function() {
  $('.presentation').on('mouseenter', function() {
    $(this).addClass('active');
  });
  $('.presentation').on('mouseleave', function() {
    $(this).removeClass('active');
  });
});