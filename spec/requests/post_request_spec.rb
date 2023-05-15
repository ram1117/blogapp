require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  before :all do
    user_attributes = {
      name: 'user 1',
      photo: 'some url link to imgur',
      bio: 'software engineer',
      posts_counter: 0,
    }
    @user = User.create! user_attributes
    post_attributes = {
      author: @user,
      title: 'first blog post',
      text: 'my first technical blog post about rspec in rails',
      comments_counter: 0,
      likes_counter: 0,
    }
    @post = Post.create! post_attributes
  end

  describe 'Get /users/[:id]/posts' do
    it 'is valid response' do
      get '/users/1/posts/'
      expect(response).to have_http_status(200)
    end
    it 'correct template is rendered' do
      get '/users/1/posts/'
      expect(response).to render_template('posts/index')
    end
    it 'response body has placeholder text' do
      get '/users/1/posts/'
      expect(response.body).to include('My first tech blog')
    end
  end

  describe 'Get /users/[:id]/posts/[:id]' do
    it 'is valid response' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end
    it 'correct template is rendered' do
      get '/users/1/posts/1'
      expect(response).to render_template('posts/show')
    end
    it 'response body has placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to include('My first tech blog')
    end
  end
end
