class User < ApplicationRecord
  has_one_attached :image
  has_secure_password
  validates :username, presence: true;
  validates :email, presence: true, uniqueness: true
  has_many :questions
end
