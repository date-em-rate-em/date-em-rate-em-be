require 'rails_helper'

RSpec.describe 'create user', type: :request do
  describe 'mutation: userCreate' do
    it 'creates client and review' do

      post graphql_path, params: { query: mutation(
        email: "email@test.com",
        password: "password",
        password_confirmation: "password"
        ) }
      json_response = JSON.parse(response.body, symbolize_names: true)
      actual = json_response[:data][:userCreate][:user][:email]

      expect(actual).to eq("email@test.com")
    end
  end

  def mutation(email:, password:, password_confirmation:)
    <<~GQL
      mutation{
        userCreate(
          email: "#{email}",
          password: "#{password}",
          passwordConfirmation: "#{password_confirmation}"
        )
        {
          user{
            email
            id
          }
        }
      }
    GQL
  end
end
