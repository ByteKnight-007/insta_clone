class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3,  maximum: 100}
  validates :description, presence: true, length: { minimum: 2, maximum: 250 }
  validates :keyword, presence: true, length: {minimum: 2, maximum: 150 }

  has_many_attached :images
end