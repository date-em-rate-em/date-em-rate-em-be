class Client < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  validate :client_must_have_identifier

  def client_must_have_identifier
    unless email.present? || phone.present?
      errors.add(:email, "Reviews must have a client email or phone number.")
      errors.add(:phone, "Reviews must have a client email or phone number.")
    end
  end
end
