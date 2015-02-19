class Dish < ActiveRecord::Base
  has_many :dish_recipes, dependent: :destroy
  has_many :recipes, through: :dish_recipes

  has_many :menu_dishes, dependent: :destroy
  has_many :menus, through: :menu_dishes

  validates :name, :price, presence: true
  # validates :name, uniqueness: { scope: :menu_dish }
  validates :description, length: {maximum: 100}
end
