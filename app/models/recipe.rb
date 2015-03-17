class Recipe < ActiveRecord::Base

  belongs_to :user
  
  has_many :dish_recipes, dependent: :destroy
  has_many :dishes, through: :dish_recipes

  has_many :inclusions, dependent: :nullify
  has_many :ingredients, through: :inclusions, dependent: :nullify

  has_many :preferences, dependent: :destroy
  has_many :users, through: :preferences

  validates :name, presence: true

end
