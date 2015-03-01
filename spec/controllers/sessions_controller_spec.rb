require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }

  describe "#new" do
    it "sets a new user instance" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "#create" do
    context "successful login" do
      def valid_user_request 
          post :create, user: {email: user.email,
                               password: user.password}
      end

      it "sets the user_id session variable for a regular user" do
        valid_user_request
        expect(session[:user_id]).to eq(user.id)
      end
      
    end
  end
end
