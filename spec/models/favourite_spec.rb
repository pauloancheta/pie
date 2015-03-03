require 'rails_helper'

RSpec.describe Favourite, type: :model do

  context 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:favourited_user).class_name(:User) }
  end

  context 'column specification' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:favourited_user_id).of_type(:integer) }
  end

end
