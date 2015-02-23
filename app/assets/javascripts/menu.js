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

  $('.showRecipe').on('click', function() {
    $(this).find('.recipe').fadeToggle();
  });
});