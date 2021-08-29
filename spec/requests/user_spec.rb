require 'rails_helper'

RSpec.describe 'single_user' do
  it 'returns a single user' do
    user_1 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")

    query_string = "{ singleUser(id: 1) { email } }"
    post graphql_path(params: { query: query_string })
    json_response = JSON.parse(@response.body, symbolize_names: true)

    expected = user_1.email
    actual = json_response[:data][:singleUser][:email]

    expect(actual).to eq(expected)
  end
end