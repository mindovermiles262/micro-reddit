class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },format: { with: valid_email_regex }

  has_many :posts
end
