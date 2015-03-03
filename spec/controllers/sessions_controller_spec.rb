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
          post :create, email: user.email, password: user.password
      end

      it "sets the user_id session variable for a regular user" do
        valid_user_request
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to the restaurants path for a regular user" do
        valid_user_request
        expect(response).to redirect_to '/restaurants'
      end

      it "sets a flash alert" do
        valid_user_request
        expect(flash[:alert]).to be
      end
    end

    context "unsuccessful login" do
      def invalid_user_request
        post :create, email: nil, password: user.password
      end

      it "doesnt set the user_id as sessions variable for a regular user" do
        invalid_user_request
        expect(session[:user_id]).not_to be
      end

      it "redirects to login page" do
        invalid_user_request
        expect(response).to redirect_to '/login'
      end

      it "sets a flash alert for unsuccessful login" do
        invalid_user_request
        expect(flash[:alert]).to be
      end
    end
  end

  describe "#destroy" do
    before do
      login(user)
      delete :destroy
    end

    it "removes the session user_id variable" do
      expect(session[:user_id]).not_to be
    end

    it "redirects to the login page" do
      expect(response).to redirect_to '/login'
    end

    it "sets a flash notice upon logging out" do
      expect(flash[:notice]).to be
    end
  end
end
