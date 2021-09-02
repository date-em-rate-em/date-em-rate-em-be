module Mutations
  class UserCreate < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: false
    field :errors, [Types::UserCreateErrorType], null: false

    def resolve(email:, password:, password_confirmation:)
      user = User.new(email: email, password: password, password_confirmation: password_confirmation)

      if user.save
        {
          user: user,
          errors: []
        }
      else
        user_error = user.errors.map do |attribute, message|

        path = ["credentials", attribute.to_s.camelize(:lower)]
        {
          path: path,
          message: message
        }
        end
      {
        user: user,
        errors: user_error
      }
    end
    end
  end
end
