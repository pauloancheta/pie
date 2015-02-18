class Dish < ActiveRecord::Base
  has_many :dish_recipes, dependent: :destroy
  has_many :recipes, through: :dish_recipes

  validates :name, :price, presence: true 
    #uniquness: {scope: menu}
end
