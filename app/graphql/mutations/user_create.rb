module Mutations
  class UserCreate < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::CreateAuthProviderCredentials, required: false
    end

    argument :auth_provider, AuthProviderSignupData, required: false

    field :user, Types::UserType, null: false


    def resolve(auth_provider: nil)
      user = User.new(
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password),
        password_confirmation: auth_provider&.[](:credentials)&.[](:password_confirmation)
      )
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
