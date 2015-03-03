require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  context 'association' do
    it { should have_many(:inclusions).dependent(:destroy) }
    it { should have_many(:recipes).through(:inclusions) }
  end 

  context 'validations' do
    it { should validate_presence_of(:name) }
  end 
  
end