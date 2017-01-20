require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #anonymous" do
    it "responds successfully with an HTTP 200 status code" do
      get :anonymous
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the anonymous template" do
      get :anonymous
      expect(response).to render_template("anonymous")
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
