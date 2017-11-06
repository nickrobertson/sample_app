require 'rails_helper'

RSpec.describe StaticPagesController, :type => :request do
  let(:title) { 'Ruby on Rails Tutorial Sample App' }

  describe 'GET #home' do
    it 'returns a 200 custom status code' do
      get root_path
      expect(response.status).to eq(200)
      expect(response.body).to include("<title>#{title}</title>")
    end
  end

  describe 'GET #help' do
    it 'returns a 200 custom status code' do
      get help_path
      expect(response.status).to eq(200)
      expect(response.body).to include("<title>Help | #{title}</title>")
    end
  end

  describe 'GET #about' do
    it 'returns a 200 custom status code' do
      get about_path
      expect(response.status).to eq(200)
      expect(response.body).to include("<title>About | #{title}</title>")
    end
  end

  describe 'GET #contact' do
    it 'returns a 200 custom status code' do
      get contact_path
      expect(response.status).to eq(200)
      expect(response.body).to include("<title>Contact | #{title}</title>")
    end
  end
end