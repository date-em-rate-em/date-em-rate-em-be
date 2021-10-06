module Types
  class CreateAuthProviderCredentials < BaseInputObject
    graphql_name 'NEW_CREDENTIALS'

    argument:email, String, required: true
    argument:password, String, required: true
    argument:password_confirmation, String, required: true
  end
end
