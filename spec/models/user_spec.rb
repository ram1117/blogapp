require 'rails_helper'

RSpec.describe User, type: :model do
  after :all do
    Post.destroy_all
    User.destroy_all
  end
  subject do
    User.new(name: 'ram', photo: 'someURL', bio: 'student', posts_counter: 0)
  end
  before { subject.save }

  describe 'check user validity' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid with name missing' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid with posts_counter < 0' do
      subject.posts_counter = -5
      expect(subject).to_not be_valid
    end

    it 'is invalid with posts_counter not integer' do
      subject.posts_counter = 'five'
      expect(subject).to_not be_valid
    end
  end

  describe 'user model methods' do
    it '#last_three_posts' do
      4.times do |i|
        Post.create(
          title: "blog #{i}",
          author: subject,
          text: "This is my blog no: #{i}",
          comments_counter: 0,
          likes_counter: 0,
        )
      end
      expect(subject.last_three_posts.length).to eql 3
    end
  end
end
