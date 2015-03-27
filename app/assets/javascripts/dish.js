$(document).ready(function() {

  $('.addDish').on('click', function() {
    $('.dishForm').fadeToggle();
  });

  $('.recipe_list_container').on('click','.recipe_list', function(event) {
    var recipeId = $(this).data('recipe-id'),
            name = $(this).data('name'),
          dishId = $(this).data('dish-id'),
             url = '/dishes/' + dishId + '/add_recipe/' + recipeId;

    $(this).hide();
    $('.dish_recipe_container').append('<div class="dish_recipes" data-dish-id=" ' + dishId + ' " data-recipe-id="' + recipeId.toString() + '" data-name="' +  name.toString() + '">'+name+'</div>');



    $.post(url, function(data){
      
    });
  });

  $('.dish_recipe_container').on('click', '.dish_recipes', function() {
    var recipeId = $(this).data('recipe-id'),
            name = $(this).data('name'),
          dishId = $(this).data('dish-id'),
             url = '/dishes/' + dishId + '/remove_recipe/' + recipeId;
    $('.recipe_list_container').append('<div class="recipe_list" data-dish-id=" ' + dishId + ' " data-recipe-id="' + recipeId.toString() + '" data-name="' +  name.toString() + '">'+name+'</div>');    
    $(this).hide();
    $.ajax({
      url: url,
      type: 'DELETE',
      success: function(data){
        
      }
    });

  });

  $('.like_container').on('click','p.like', function() {
    var dishId = $(this).data('dish-id'),
        userId = $(this).data('user-id');
           url = '/dish/' + dishId + '/add_like/' + userId;
    $(this).hide();
    $(this).parent().append('<p class="unlike" data-dish-id="' + dishId + '" data-user-id="' + userId + '"><a><span class="glyphicon glyphicon-star"></span></a></p>');

    $.post(url, function(data){
    });
  });

  $('.like_container').on('click','p.unlike', function() {
    var dishId = $(this).data('dish-id'),
        userId = $(this).data('user-id');
           url = '/dish/' + dishId + '/remove_like/' + userId;
    $(this).hide();
    $(this).parent().append('<p class="like" data-dish-id="' + dishId + '" data-user-id="' + userId + '"><a><span class="glyphicon glyphicon-star-empty"></span></a></p>');

    $.ajax({
      url: url,
      type: 'DELETE',
      success: function(data){
      }
    });
  });

  $('.menu_name').on('click', function() {
    $(this).find('div.row__ingredients_index').fadeToggle();
  });

});

