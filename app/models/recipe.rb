class Recipe < ActiveRecord::Base
  belongs_to :dish

  validates :name, presence: true
end
