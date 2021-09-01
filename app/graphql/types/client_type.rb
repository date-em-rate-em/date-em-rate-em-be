module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false

    field :reviews, [Types::ReviewType], null: true
    field :average_rating, Float, null: true
    field :average_safety_meter, Float, null: true

    def average_rating
      self.object.reviews.average(:rating)
    end

    def average_safety_meter
      self.object.reviews.average(:safety_meter)
    end
  end
end
