require "rails_helper"

RSpec.describe JobBoardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/job_boards").to route_to("job_boards#index")
    end

    it "routes to #new" do
      expect(:get => "/job_boards/new").to route_to("job_boards#new")
    end

    it "routes to #show" do
      expect(:get => "/job_boards/1").to route_to("job_boards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/job_boards/1/edit").to route_to("job_boards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/job_boards").to route_to("job_boards#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/job_boards/1").to route_to("job_boards#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/job_boards/1").to route_to("job_boards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/job_boards/1").to route_to("job_boards#destroy", :id => "1")
    end

  end
end
