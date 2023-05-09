require 'rails_helper'
RSpec.describe 'Users', type: :request do
  before :all do
    @valid_attributes = {
      name: 'user 1',
      photo: 'some url link to imgur',
      bio: 'software engineer',
      posts_counter: 0
    }
    @user = User.create! @valid_attributes
  end
  describe 'get /users' do
    it 'is valid response' do
      get '/users'
      expect(response).to have_http_status(200)
    end
    it 'correct template is rendered' do
      get '/users'
      expect(response).to render_template 'users/index'
    end

    it 'response body has placeholder text' do
      get '/users'
      expect(response.body).to include('List of users')
    end
  end

  describe 'get /user=[:id]' do
    it 'is valid response' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end
    it 'is correct template rendered' do
      get '/users/1'
      expect(response).to render_template 'users/show'
    end

    it 'response body has placeholder text' do
      get '/users/1'
      expect(response.body).to include('User details by ID')
    end
  end
end
