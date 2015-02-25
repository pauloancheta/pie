$(document).ready(function() {
  
  $('.addRecipe').on('click', function() {
    $('.recipeForm').fadeToggle();
  });

  $('#recipeLink').hide();

  $('#recipeRow').on('click', function() {
    $('#recipeLink').fadeOut();
  });

  $('#recipeRow').on('mouseenter', function() {
    $('#recipeLink').fadeIn();
  });

  $('#recipeRow').on('mouseleave', function() {
    $('#recipeLink').fadeOut();
  });

});