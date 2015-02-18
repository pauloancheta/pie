class Recipe < ActiveRecord::Base
  has_many :dishes, through: :dish_recipes
  has_many :dish_recipes, dependent: :destroy

  has_many :ingredients, dependent: :destroy


  validates :name, presence: true
end
