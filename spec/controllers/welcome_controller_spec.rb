require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #anonymous" do
    it "responds successfully with a redirect" do
      get :anonymous
      expect(response).to redirect_to welcome_index_path
    end
    it "populates @user" do
      get :anonymous
      expect(assigns(:user)).to be
    end
    it "generates an email from globalcorp" do
      get :anonymous
      expect(assigns(:user).email).to end_with("@users.globalcorp.international")
    end
  end
end
