class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  followability

  has_many :posts
  has_many :comments
  has_one_attached :avatar
  has_many :likes

  before_create :randomize_id

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  private
  def randomize_id
    begin
      self.id = SecureRandom.uuid
    end while User.where(id: self.id).exists?
  end
end
