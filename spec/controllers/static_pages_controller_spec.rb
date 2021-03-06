require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  describe "Homepage" do
    it 'loads the homepage' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("welcome-image-container")
    end

    it 'contains a sign up link' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Sign up")
    end

    it 'contains a log in link' do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include("Sign in")
    end
  end
end
