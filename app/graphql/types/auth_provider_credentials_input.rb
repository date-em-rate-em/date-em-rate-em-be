module Types
  class AuthProviderCredentialsInput < BaseInputObject
    graphql_name 'AUTH_CREDENTIALS'

    argument:email, String, required: true
    argument:password, String, required: true #???? password digest?
  end
end
