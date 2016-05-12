require "rails_helper"

RSpec.describe BoredsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/boreds").to route_to("boreds#index")
    end

    it "routes to #new" do
      expect(:get => "/boreds/new").to route_to("boreds#new")
    end

    it "routes to #show" do
      expect(:get => "/boreds/1").to route_to("boreds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/boreds/1/edit").to route_to("boreds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/boreds").to route_to("boreds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/boreds/1").to route_to("boreds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/boreds/1").to route_to("boreds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/boreds/1").to route_to("boreds#destroy", :id => "1")
    end

  end
end
