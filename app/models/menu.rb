class Menu < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :menu_dishes, dependent: :destroy
  has_many :dishes, through: :menu_dishes

end
