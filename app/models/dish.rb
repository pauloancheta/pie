class Dish < ActiveRecord::Base
  has_many :recipes, dependent: :destroy

  validates :name, :price, presence: true 
    #uniquness: {scope: menu}
end
