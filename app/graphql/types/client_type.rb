module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :phone, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

    field :reviews, [Types::ReviewType], null: true
    field :average_rating, Float, null: true
    field :average_safety_meter, Float, null: true
    field :average_size, Float, null: true
    field :average_hygiene, Float, null: true
    field :average_duration, Float, null: true
    field :average_vibe, Float, null: true
    field :average_payment, Float, null: true

    def average_rating
      self.object.reviews.average(:rating)
    end

    def average_payment
      self.object.reviews.average(:payment)
    end

    def average_safety_meter
      self.object.reviews.average(:safety_meter)
    end

    def average_size
      self.object.reviews.average(:size)
    end

    def average_duration
      self.object.reviews.average(:duration)
    end

    def average_hygiene
      self.object.reviews.average(:hygiene)
    end

    def average_vibe
      self.object.reviews.average(:vibe)
    end
  end
end
