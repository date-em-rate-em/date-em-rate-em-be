module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false

    field :reviews, [Types::ReviewType], null: true
    field :average_rating, Integer, null: true

    def average_rating
      self.object.reviews.average(:rating)
    end
  end
end
