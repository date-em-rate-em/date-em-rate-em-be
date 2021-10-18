class Review < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :user, presence: true
  validates :client, presence: true
  validates :rating, presence: true
  validates :safety_meter, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1 }
  validates :rating, numericality: { less_than_or_equal_to: 5 }
  validates :safety_meter, numericality: { greater_than_or_equal_to: 1 }
  validates :safety_meter, numericality: { less_than_or_equal_to: 10 }
  validates :size, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :size, numericality: { less_than_or_equal_to: 12, allow_nil: true }
  validates :payment, numericality: { greater_than_or_equal_to: 1, allow_nil: true }
  validates :payment, numericality: { less_than_or_equal_to: 10, allow_nil: true }
  validates :hygiene, numericality: { greater_than_or_equal_to: 1, allow_nil: true, message: "Please select a number between 1 and 10" }
  validates :hygiene, numericality: { less_than_or_equal_to: 10, allow_nil: true }
  validates :vibe, numericality: { greater_than_or_equal_to: 1, allow_nil: true }
  validates :vibe, numericality: { less_than_or_equal_to: 10, allow_nil: true }
  validates :duration, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :duration, numericality: { less_than_or_equal_to: 24, allow_nil: true }
end
