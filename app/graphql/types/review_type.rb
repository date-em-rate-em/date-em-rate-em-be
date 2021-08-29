module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :client_id, Integer, null: false
    field :user_id, Integer, null: false
    field :body, String, null: false
    field :rating, Integer, null: false
    field :title, String, null: false
    field :size, Float, null: false
    field :payment, Integer, null: false
    field :extended_body, String, null: false
    field :kindness, Integer, null: false
    field :vibe, Integer, null: false
    field :date_again, Boolean, null: false
    field :safety_meter, Integer, null: false
    field :gender, String, null: false
  end
end
