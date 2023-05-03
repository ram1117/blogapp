require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user3 =
      User.create(
        name: 'Ben',
        photo: 'some_link',
        bio: 'developer',
        posts_counter: 0
      )
    @post3 =
      Post.create(
        author: @user2,
        title: 'Blog 2',
        text: 'My first tech blog',
        comments_counter: 0,
        likes_counter: 0
      )
  end
  after :all do
    Like.destroy_all
    Post.destroy_all
    User.destroy_all
  end
  subject { Like.new(post: @post3, author: @user3) }
  describe 'check like validity' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
  describe 'test like model function' do
    it '#update_likes_counter' do
      subject.update_likes_counter
      expect(@post3.likes_counter).to eql 1
    end
  end
end
