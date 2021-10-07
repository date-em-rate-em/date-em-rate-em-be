require 'rails_helper'

RSpec.describe 'create user', type: :request do
  describe 'mutation: userCreate' do
    describe 'happy path' do
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

  describe 'sad path' do
    describe 'passwords do not match'
      it 'returns an error' do
        post graphql_path, params: { query: mutation(
          email: "email@test.com",
          password: "password",
          password_confirmation: "password_1"
          ) }

        json_response = JSON.parse(response.body, symbolize_names: true)

        actual = [json_response[:errors][0][:message], response.status]
        expected = ["Validation failed: Password confirmation doesn't match Password", 405]

        expect(actual).to eq(expected)
      end
    end

    describe 'email already used' do
      it 'returns an error' do
        post graphql_path, params: { query: mutation(
          email: "email@test.com",
          password: "password",
          password_confirmation: "password"
          ) }

          post graphql_path, params: { query: mutation(
            email: "email@test.com",
            password: "password",
            password_confirmation: "password"
            ) }

        json_response = JSON.parse(response.body, symbolize_names: true)

        actual = [json_response[:errors][0][:message], response.status]
        expected = ["Validation failed: Email has already been taken", 405]

        expect(actual).to eq(expected)
      end
    end
  end


  def mutation(email:, password:, password_confirmation:)
    <<~GQL
      mutation{
        userCreate(
          authProvider: {
            credentials: {
              email: "#{email}",
              password: "#{password}",
              passwordConfirmation: "#{password_confirmation}"
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
