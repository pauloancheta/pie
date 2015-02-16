class Ingredient < ActiveRecord::Base
  validates :name, :category, presence: true
end
