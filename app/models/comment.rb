class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_comments_count
    post.update(comments_counter: post.comments.size)
  end
end
