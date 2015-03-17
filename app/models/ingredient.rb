class Ingredient < ActiveRecord::Base
  before_save :format_name
  has_many :inclusions, dependent: :nullify
  has_many :recipes, through: :inclusions, dependent: :nullify

  belongs_to :dish

  validates :name, presence: true

  def format_name
    self.name.downcase!
    self.name = self.name.singularize
  end

  def self.find_or_create(new_ingredient)
    ingredient = Ingredient.where(name: new_ingredient["name"].downcase.singularize, 
                                  category: new_ingredient["category"]).first
    unless ingredient
      ingredient = Ingredient.create(name: new_ingredient["name"],
                                     category: new_ingredient["category"])
    end
    ingredient
  end

end
