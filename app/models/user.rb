class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments


  before_create :randomize_id



  private
  def randomize_id
    begin
      self.id = SecureRandom.uuid
    end while User.where(id: self.id).exists?
  end
end
