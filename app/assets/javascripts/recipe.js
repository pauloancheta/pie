$(document).ready(function() {
  
  $('#addRecipe').on('click', function() {
    $('#recipeForm').fadeToggle();
  });

  $('#addIngredient').on('click', function() {
    $('#ingredientsForm').fadeToggle();
  });

});