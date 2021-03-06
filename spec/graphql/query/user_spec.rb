require 'rails_helper'

RSpec.describe 'single_user', type: :request  do
  describe 'happy path' do
    it 'returns a single user' do
      user_1 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")

      query_string = "{ singleUser(id: #{user_1.id}) { email } }"
      post graphql_path(params: { query: query_string })
      json_response = JSON.parse(@response.body, symbolize_names: true)

      expected = user_1.email
      actual = json_response[:data][:singleUser][:email]

      expect(actual).to eq(expected)
    end
  end
  describe 'sad path' do
    describe 'cannot find user' do
      it 'returns an error message' do
      user_1 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")

      query_string = "{ singleUser(id: 0) { email } }"
      post graphql_path(params: { query: query_string })
      json_response = JSON.parse(@response.body, symbolize_names: true)

      expected = "Couldn't find User with 'id'=0"
      actual = json_response[:errors][0][:message]
      
      expect(actual).to eq(expected)
      end
    end
  end
end