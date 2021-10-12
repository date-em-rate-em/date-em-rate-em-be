module Mutations
  class SignIn < BaseMutation
    class AuthProviderSignInData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end
      argument :auth_provider, AuthProviderSignInData, required: false

      field :token, String, null: true
      field :user, Types::UserType, null: true

    def resolve(auth_provider: nil)

      return unless auth_provider

      user = User.find_by!(email: auth_provider&.[](:credentials)&.[](:email))

      return unless user.authenticate(auth_provider&.[](:credentials)&.[](:password))

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{user.id}")

      { user: user, token: token }
    end
  end
end
