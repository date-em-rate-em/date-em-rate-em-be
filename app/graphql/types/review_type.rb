module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :client_id, Integer, null: false
    field :user_id, Integer, null: false
    field :body, String, null: false
    field :rating, Integer, null: false

  end
end
