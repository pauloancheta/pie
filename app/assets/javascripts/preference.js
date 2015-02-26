$(document).ready(function() {
  $('.add_preference_ingredient').on('click', function(){
    $('.preference_ingredient_form').fadeToggle()
  });

  $('.edit_diet').on('click', function(){
    $('.diet_form').fadeToggle()
  });
});