class Dish < ActiveRecord::Base
  # not being used?
  belongs_to :user
  belongs_to :menu

  has_many :likes
  has_many :liking_users, through: :likes, source: :user

  has_many :dish_recipes, dependent: :destroy
  has_many :recipes, through: :dish_recipes

  # has_many :menu_dishes, dependent: :destroy
  # has_many :menus, through: :menu_dishes, dependent: :destroy

  #added to make it easier to sesarch for all the ingredients of a dish
  has_many :ingredients, through: :recipes, dependent: :destroy

  validates :name, :price, presence: true
  # validates :name, uniqueness: { scope: :menu_dish }
  validates :description, length: {maximum: 100}
end


