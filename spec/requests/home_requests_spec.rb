require "rails_helper"

RSpec.describe "Home", :type => :request do

  describe 'GET /' do
    before{ get "/"}

    it "render the home template" do
      expect(response).to render_template(:home)
      expect(response.status).to be(200)
      expect(response.body).to include("A tutta pista")
    end
  end
end