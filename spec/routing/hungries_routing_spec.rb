require "rails_helper"

RSpec.describe HungriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hungries").to route_to("hungries#index")
    end

    it "routes to #new" do
      expect(:get => "/hungries/new").to route_to("hungries#new")
    end

    it "routes to #show" do
      expect(:get => "/hungries/1").to route_to("hungries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hungries/1/edit").to route_to("hungries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hungries").to route_to("hungries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hungries/1").to route_to("hungries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hungries/1").to route_to("hungries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hungries/1").to route_to("hungries#destroy", :id => "1")
    end

  end
end
