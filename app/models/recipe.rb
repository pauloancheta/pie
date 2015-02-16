class Recipe < ActiveRecord::Base
  belongs_to :dish
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true
end
