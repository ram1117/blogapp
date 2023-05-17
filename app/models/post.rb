class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_save :update_posts_counter
  after_destroy :decrease_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
            }
  validates :likes_counter,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
            }

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def decrease_posts_counter
    author.decrement!(:posts_counter)
  end

  def last_five_comments
    comments.includes(:author).order(updated_at: :desc).limit(5)
  end
end
