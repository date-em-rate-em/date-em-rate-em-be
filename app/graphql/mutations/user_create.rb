module Mutations
  class UserCreate < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: false

    def resolve(email:, password:, password_confirmation:)
      user = User.new(email: email, password: password, password_confirmation: password_confirmation)
      if user.save
        {
          user: user
        }
      else
        raise ActiveRecord::RecordInvalid.new user
      end
    end
  end
end
