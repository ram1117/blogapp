require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @user1 =
      User.create(
        name: 'mark',
        photo: 'some_link',
        bio: 'developer',
        posts_counter: 0
      )
  end
  after :all do
    Post.destroy_all
    User.destroy_all
  end
  subject do
    Post.new(
      author: @user1,
      title: 'Blog 1',
      text: 'My first tech blog',
      comments_counter: 0,
      likes_counter: 0
    )
  end
  describe 'check post validity' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is invalid with title missing' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with title >250 chars' do
      titletext = ''
      251.times { titletext += 'a' }
      subject.title = titletext
      expect(subject).to_not be_valid
    end

    it 'is invalid with comments_counter < 0' do
      subject.comments_counter = -5
      expect(subject).to_not be_valid
    end
    it 'is invalid with comments_counter not integer' do
      subject.comments_counter = 'five'
      expect(subject).to_not be_valid
    end

    it 'is invalid with likes_counter < 0' do
      subject.likes_counter = -6
      expect(subject).to_not be_valid
    end
    it 'is invalid with likes_counter not integer' do
      subject.likes_counter = 'six'
      expect(subject).to_not be_valid
    end
  end

  describe 'check model methods' do
    it '#update_posts_counter' do
      subject.update_posts_counter
      expect(@user1.posts_counter).to eql 1
    end
    it '#last_five_comments' do
      6.times do |i|
        Comment.create(author: @user1, post: subject, text: "comment #{i}")
      end
      expect(subject.last_five_comments.length).to eql 5
    end
  end
end
