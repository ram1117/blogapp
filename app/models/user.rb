class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attribute :posts_counter, default: 0
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
            }

  Roles = %i[admin user]

  def last_three_posts
    posts.includes(:author).order(updated_at: :desc).limit(3)
  end

  def admin?
    self.role == 'admin'
  end
end
