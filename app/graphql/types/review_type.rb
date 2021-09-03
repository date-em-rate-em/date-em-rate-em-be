module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :client_id, Integer, null: false
    field :user_id, Integer, null: true
    field :body, String, null: true
    field :rating, Integer, null: false
    field :title, String, null: true
    field :size, Float, null: true
    field :payment, Integer, null: true
    field :extended_body, String, null: true
    field :kindness, Integer, null: true
    field :vibe, Integer, null: true
    field :date_again, String, null: true
    field :safety_meter, Integer, null: false
    field :gender, String, null: true
  end
end
