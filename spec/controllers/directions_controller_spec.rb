require 'rails_helper'
# require 'spec_helper'

# rails generate rspec:install


RSpec.describe DirectionsController, type: :controller do

  describe "GET #current_address:string" do
    it "returns http success" do
      get :current_address
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destination_address:string" do
    it "returns http success" do
      get :destination_address
      expect(response).to have_http_status(:success)
    end
  end

end
