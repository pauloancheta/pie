$(document).ready(function() {

  $('.addDish').on('click', function() {
    $('.dishForm').fadeToggle();
  });

  $('.recipe_list_container').on('click','.recipe_list', function(event) {
    var recipeId = $(this).data('recipe-id'),
            name = $(this).data('name'),
             url = '/dishes/' + $(this).data('dish-id') + '/add_recipe/' + recipeId;

    $(this).hide();
    $('.dish_recipe_container').append('<div class="dish_recipes" data-recipe-id="' + recipeId.toString() + '" data-name="' +  name.toString() + '">'+name+'</div>');



    $.post(url, function(data){
      
    });
  });

  $('.dish_recipe_container').on('click', '.dish_recipes', function() {
    var recipeId = $(this).data('recipe-id'),
            name = $(this).data('name'),
             url = '/dishes/' + $(this).data('dish-id') + '/remove_recipe/' + recipeId;
    $(this).hide();
    $.ajax({
      url: url,
      type: 'DELETE',
      success: function(data){
        
      }
    });

    $('.recipe_list_container').append('<div class="recipe_list" data-recipe-id="' + recipeId.toString() + '" data-name="' +  name.toString() + '">'+name+'</div>');    
  });

});

