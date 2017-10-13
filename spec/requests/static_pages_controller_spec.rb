require "rails_helper"

RSpec.describe StaticPagesController, :type => :controller do
  render_views
    let(:title) { 'Ruby on Rails Tutorial Sample App' }

  describe 'GET #home' do
    it 'returns a 200 custom status code' do
      get 'home'
      expect(response.status).to eq(200)
      expect(response.body).to include("<title>Home | #{title}</title>")
    end
  end

  describe 'GET #help' do
    it 'returns a 200 custom status code' do
      get 'help'
      expect(response.status).to eq(200)
      expect(response.body).to include("<title>Help | #{title}</title>")
    end
  end

  describe 'GET #about' do
    it 'returns a 200 custom status code' do
      get 'about'
      expect(response.status).to eq(200)
      expect(response.body).to include("<title>About | #{title}</title>")
    end
  end

  describe 'GET #contact' do
    it 'returns a 200 custom status code' do
      get 'contact'
      expect(response.status).to eq(200)
      expect(response.body).to include("<title>Contact | #{title}</title>")
    end
  end
end