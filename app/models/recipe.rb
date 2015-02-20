class Recipe < ActiveRecord::Base
  has_many :dish_recipes, dependent: :destroy
  has_many :dishes, through: :dish_recipes

  has_many :inclusions, dependent: :destroy
  has_many :ingredients, through: :inclusions

  belongs_to :preferences

  validates :name, presence: true
end
