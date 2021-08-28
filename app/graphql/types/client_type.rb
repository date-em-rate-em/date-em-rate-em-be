module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
  end
end
