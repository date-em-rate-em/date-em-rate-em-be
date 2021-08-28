module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :client_id, Integer, null: false
    field :user_id, Integer, null: false
    field :body, String, null: false
    field :rating, Integer, null: false

    field :high_to_low_ratings, [Types::ReviewType], null: true

    def high_to_low_ratings
      Review.order(rating: :desc)
    end
  end
end
