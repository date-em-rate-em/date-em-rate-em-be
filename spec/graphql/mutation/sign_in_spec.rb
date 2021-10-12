require 'rails_helper'

RSpec.describe 'sign in', type: :request do
  describe 'mutation: signIn' do
    describe 'happy path' do
      it 'passes frontend an encrypted cookie for sign in' do

      user = User.create!(email: "email@test.com", password: "password", password_confirmation: "password")

      post graphql_path, params: { query: mutation(
        email: "email@test.com",
        password: "password"
        )}
        json_response = JSON.parse(response.body, symbolize_names: true)
        actual = [json_response[:data][:signIn][:user][:email], response.status]
        expected = ["email@test.com", 200]

        expect(actual).to eq(expected)
      end
    end

    describe 'sad path' do
      it 'responds with error if email is incorrect' do
        user = User.create!(email: "email@test.com", password: "password", password_confirmation: "password")

        post graphql_path, params: { query: mutation(
          email: "emailbutts@test.com",
          password: "password"
          )}
          json_response = JSON.parse(response.body, symbolize_names: true)
          actual = [json_response[:errors][0][:message], response.status]
          expected = ["Couldn't find User", 404]

          expect(actual).to eq(expected)
      end
    end
  end

  def mutation(email:, password:)
    <<~GQL
      mutation{
        signIn(
          authProvider: {
            credentials: {
              email: "#{email}",
              password: "#{password}"
            }
          }
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
