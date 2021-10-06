class User < ApplicationRecord
  has_secure_password

  has_many :reviews
  has_many :clients, through: :reviews

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
end
