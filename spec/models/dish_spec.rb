require 'rails_helper'

RSpec.describe Dish, type: :model do

  context 'association' do
    it { should have_many(:dish_recipes).dependent(:destroy) }
    it { should have_many(:recipes).through(:dish_recipes) }

    it { should have_many(:likes) }
    it { should have_many(:liking_users).through(:likes).source(:user) }

    it { should have_many(:menu_dishes).dependent(:destroy) }
    it { should have_many(:menus).through(:menu_dishes) }

    it { should have_many(:ingredients).through(:recipes).dependent(:destroy) }
  end

  context 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_length_of(:description).is_at_most(100) }
  end

  context 'column specification' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:price).of_type(:float) }
    it { should have_db_column(:description).of_type(:string) }
  end 
  
end 