require 'rails_helper'

RSpec.describe Recipe, type: :model do


  context 'association' do
    it { should belong_to(:user) }

    it { should have_many(:dish_recipes).dependent(:destroy) }
    it { should have_many(:dishes).through(:dish_recipes) }

    it { should have_many(:inclusions).dependent(:nullify) }
    it { should have_many(:ingredients).through(:inclusions) }

    it { should have_many(:preferences).dependent(:destroy) }
    it { should have_many(:users).through(:preferences) }
  end 

  context 'validations' do
    it { should validate_presence_of(:name) }
  end 

  context 'column specification' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end 

end