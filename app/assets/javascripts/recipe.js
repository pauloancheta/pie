$(document).ready(function() {
  
  $('.addRecipe').on('click', function() {
    $('.recipeForm').fadeToggle();
  });

  // on every keypress of search_recipes
  $('#search_recipes').on('keyup', function() {
    if( $(this).val() ){
      $('.panel').hide();
      $('div').find('div[id*="' + $(this).val() + '"] .panel').show();
    }
    else{
      $('.panel').show();
    }
  });

  if ( $('a[href="#all"]').parent().hasClass('active') ) {
    // $('a[data-parent="#accordion"]').attr('href', '#collapseOne<%= dom_id(r) %>')
    // $('a[href="#all"]').attr('href', 'a')
  }

});