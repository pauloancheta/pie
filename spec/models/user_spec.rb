require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:user)).to be_valid
    end
    it "is invalid without a name" do
      expect(FactoryGirl.build(:user, name: nil)).to be_invalid
    end
    it "is invalid without an email" do
      expect(FactoryGirl.build(:user, email: nil)).to be_invalid
    end
    it "is invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).to be_invalid
    end
    it "is invalid without a password confirmation" do
      expect(FactoryGirl.build(:user, password_confirmation: nil)).to be_invalid
    end
  end

  describe "hashing the password" do
    def user_params
      params.require(:user).permit(:name, :address, :phone_number, :email, :password, :password_confirmation, :is_admin)
    end
    it "generate password digest when given password" do
      user = User.create(name:'bran',
                         address:'123 lol road',
                         email: 'brandyn.prasad@gmail.com',
                         phone_number: '123 123 1234',
                         password: 'lol123',
                         password_confirmation: 'lol123'
                         )
      user.save
      expect(user.password_digest).to be
    end
  end
end
