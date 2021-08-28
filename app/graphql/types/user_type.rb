module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :password_digest, String, null: false

    field :reviews, [Types::ReviewType], null: true
    field :review_count, Integer, null: true
    # field :reviews_high_to_low, [Types::ReviewType], null: true

    def review_count
      object.reviews.size
    end
    # def reviews_high_to_low
    # end
  end
end
