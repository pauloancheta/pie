class Ingredient < ActiveRecord::Base
  validates :name, :category, presence: true

  has_many :inclusions, dependent: :destroy
  has_many :recipes, through: :inclusions
end
