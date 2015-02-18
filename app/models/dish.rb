class Dish < ActiveRecord::Base
  has_many :recipes, through: :dish_recipes
  has_many :dish_recipes, dependent: :destroy

  validates :name, :price, presence: true 
    #uniquness: {scope: menu}
end
