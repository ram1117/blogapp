require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user2 =
      User.create(
        name: 'Ben',
        photo: 'some_link',
        bio: 'developer',
        posts_counter: 0
      )
    @post2 =
      Post.create(
        author: @user2,
        title: 'Blog 2',
        text: 'My first tech blog',
        comments_counter: 0,
        likes_counter: 0
      )
  end
  after :all do
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end
  subject { Comment.new(post: @post2, author: @user2, text: 'Nice blog') }
  describe 'check comment validity' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
  describe 'test comment model function' do
    it '#update_comments_counter' do
      subject.update_comments_counter
      subject.update_comments_counter
      expect(@post2.comments_counter).to eql 2
    end
  end
end
