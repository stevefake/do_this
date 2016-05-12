require 'rails_helper'

RSpec.describe "Boreds", type: :request do
  describe "GET /boreds" do
    it "works! (now write some real specs)" do
      get boreds_path
      expect(response).to have_http_status(200)
    end
  end
end
