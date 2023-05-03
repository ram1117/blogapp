class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def update_posts_count
    author.update(posts_counter: author.posts.size)
  end

  def last_five_comments
    self.comments.order(updated_at: :desc).limit(5)
  end
end
