require 'rails_helper'

RSpec.describe "Hungries", type: :request do
  describe "GET /hungries" do
    it "works! (now write some real specs)" do
      get hungries_path
      expect(response).to have_http_status(200)
    end
  end
end
