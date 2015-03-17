$(document).ready(function() {
  
  $('.addRecipe').on('click', function() {
    $('.recipeForm').fadeToggle();
  });

  // on every keypress of search_recipes
  $('#search_recipes').on('keyup', function() {
    if( $(this).val() ){
      $('.panel').hide();
      
      $('#all div:contains("' + $(this).val() + '") .panel').show()
    }
    else{
      $('.panel').show();
    }
  });


});