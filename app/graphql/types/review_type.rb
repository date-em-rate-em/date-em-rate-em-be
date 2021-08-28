module Types
  class ReviewType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :password_digest, String, null: false
  end
end
