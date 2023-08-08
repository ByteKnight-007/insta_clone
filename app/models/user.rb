class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_one_attached :avatar


  before_create :randomize_id



  private
  def randomize_id
    begin
      self.id = SecureRandom.uuid
    end while User.where(id: self.id).exists?
  end
end
