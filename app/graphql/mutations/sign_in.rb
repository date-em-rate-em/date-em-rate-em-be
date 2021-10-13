module Mutations
  class SignIn < BaseMutation
    class AuthProviderSignInData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end
      argument :auth_provider, AuthProviderSignInData, required: false

      field :token, String, null: true
      field :user, Types::UserType, null: true

    def resolve(auth_provider: nil)

      raise UserPasswordNotFound unless auth_provider

      user = User.find_by(email: auth_provider&.[](:credentials)&.[](:email))

      raise UserPasswordNotFound unless user

      raise UserPasswordNotFound unless user.authenticate(auth_provider&.[](:credentials)&.[](:password))

      key = Rails.application.credentials.secret_key_base.byteslice(0..31)
      crypt = ActiveSupport::MessageEncryptor.new(key)
      token = crypt.encrypt_and_sign("user-id:#{user.id}")

      { user: user, token: token }
    end
  end
end
