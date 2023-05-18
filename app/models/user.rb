class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attribute :posts_counter, default: 0

  # possible values for User.role are 'admin' and 'user'. 'user' is default
  attribute :role, default: 'user'
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

  def last_three_posts
    posts.includes(:author).order(updated_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end

  def as_json(_options)
    { id: self.id, name: self.name, bio: self.bio, posts: self.posts_counter }
  end
end
