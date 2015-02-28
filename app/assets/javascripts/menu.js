$(document).ready(function() {
  $('.presentation').on('mouseenter', function() {
    $(this).addClass('active');
  });
  $('.presentation').on('mouseleave', function() {
    $(this).removeClass('active');
  });

  $('.addMenu').on('click', function() {
    $('.menuForm').fadeToggle();
  });

  $('.show_allergy').on('click', function() {
    $('.allergy').fadeToggle();
  });
});
