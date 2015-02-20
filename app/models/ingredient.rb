class Ingredient < ActiveRecord::Base
  has_many :inclusions, dependent: :destroy
  has_many :recipes, through: :inclusions

  belongs_to :dish

  validates :name, presence: true
end
