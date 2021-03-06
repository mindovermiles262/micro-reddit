class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :body, presence: true, length: { minimum: 10, maximum: 10000 }

  belongs_to :user
end
