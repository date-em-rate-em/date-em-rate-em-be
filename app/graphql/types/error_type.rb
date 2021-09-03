module Types
  class ErrorType < Types::BaseObject
    field :message, String, null: false
    field :status, Integer, null: false
  end
end
