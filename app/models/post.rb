class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.order(updated_at: :desc).limit(5)
  end
end
