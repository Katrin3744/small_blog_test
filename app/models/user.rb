class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  has_many :posts, foreign_key: "author_id", class_name: "Post", dependent: :destroy

  validates_presence_of :name

  def author?(post)
    post.author == self
  end
end
