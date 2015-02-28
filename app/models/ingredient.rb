class Ingredient < ActiveRecord::Base
  before_save :format_name
  has_many :inclusions, dependent: :destroy
  has_many :recipes, through: :inclusions

  belongs_to :dish

  validates :name, presence: true

  def format_name
    self.name.downcase!
    self.name = self.name.singularize
  end
end
