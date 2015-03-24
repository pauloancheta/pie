class Menu < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
    
  # has_many :menu_dishes, dependent: :destroy
  has_many :dishes, dependent: :destroy

end
