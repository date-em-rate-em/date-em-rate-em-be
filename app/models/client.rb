class Client < ApplicationRecord
  include ActiveModel::Validations
  validates_with ClientIdentfiersValidation
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
end
