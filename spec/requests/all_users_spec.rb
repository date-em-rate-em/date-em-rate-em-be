require 'rails_helper'

RSpec.describe 'all_users' do
  it 'returns all users' do
    5.times do
      User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")
    end

    query_string = "{ allUsers { email } }"
    post graphql_path(params: { query: query_string })
    json_response = JSON.parse(@response.body, symbolize_names: true)

    expected = User.all.pluck(:email)
    actual = json_response[:data][:allUsers].map do |user|
      user[:email]
    end

    expect(actual).to eq(expected)
  end
end