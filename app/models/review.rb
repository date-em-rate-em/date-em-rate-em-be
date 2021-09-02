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
  validates :size, numericality: { greater_than_or_equal_to: 0 }
  validates :size, numericality: { less_than_or_equal_to: 18 }
  validates :payment, numericality: { greater_than_or_equal_to: 1 }
  validates :payment, numericality: { less_than_or_equal_to: 10 }
  validates :kindness, numericality: { greater_than_or_equal_to: 1 }
  validates :kindness, numericality: { less_than_or_equal_to: 10 }
  validates :vibe, numericality: { greater_than_or_equal_to: 1 }
  validates :vibe, numericality: { less_than_or_equal_to: 10 }
end
