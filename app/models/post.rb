class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3,  maximum: 100}
  validates :description, presence: true, length: { minimum: 2, maximum: 250 }
  validates :keyword, presence: true, length: {minimum: 2, maximum: 150 }

  has_many_attached :images
  has_many :comments
  has_many :likes

  belongs_to :user

  before_create :randomize_id



  private
  def randomize_id
    begin
      self.id = SecureRandom.uuid
    end while User.where(id: self.id).exists?
  end
end