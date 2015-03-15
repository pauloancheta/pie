$(document).ready(function() {
  $('.addDish').on('click', function() {
    $('.dishForm').fadeToggle();
  });

  $('.recipe_list').on('click', function() {
    var recipeId = $(this).data('recipe-id'),
            name = $(this).data('name');
             url = '/dishes/' + $(this).data('dish-id') + '/add_recipe/' + recipeId;
    $(this).hide();
    
    $('.dish_recipe_container').prepend($(this));

    $.post(url, function(data){
    });
  });

  $('.dish_recipes').on('click', function() {
    var recipeId = $(this).data('recipe-id'),
            name = $(this).data('name');
             url = '/dishes/' + $(this).data('dish-id') + '/remove_recipe/' + recipeId;
    $(this).hide();
    $.ajax({
      url: url,
      type: 'DELETE',
      success: function(data){
        
      }
    });
  });

});

