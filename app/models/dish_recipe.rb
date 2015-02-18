class DishRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :dish
end
