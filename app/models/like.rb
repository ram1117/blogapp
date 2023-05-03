class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_likes_count
    post.update(likes_counter: post.likes.size)
  end
end
