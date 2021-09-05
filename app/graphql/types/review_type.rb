module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :client_id, Integer, null: false
    field :user_id, Integer, null: true
    field :body, String, null: true
    field :rating, Integer, null: false
    field :size, Float, null: true
    field :payment, Integer, null: true
    field :vibe, Integer, null: true
    field :date_again, String, null: true
    field :safety_meter, Integer, null: false
    field :gender, String, null: true
    field :hygine, Integer, null: true
    field :duration, Integer, null: true
    field :condoms, String, null: true
    field :punctuality, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
