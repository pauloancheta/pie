require 'rails_helper'

RSpec.describe Preference, type: :model do

  context 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
  end 

end