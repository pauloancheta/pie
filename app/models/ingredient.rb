class Ingredient < ActiveRecord::Base
  validates :name, presence: true

  has_many :inclusions, dependent: :destroy
  has_many :recipes, through: :inclusions
end
