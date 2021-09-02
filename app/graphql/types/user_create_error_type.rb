module Types
  class UserCreateErrorType < Types::BaseObject
    field :message, String, null: false,
      description: "Incorrect credentials"
    field :path, [String], null: true,
      description: "password and password confirmation do not match"
  end
end
