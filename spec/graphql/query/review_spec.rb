require 'rails_helper'

RSpec.describe 'single_review', type: :request  do
  it 'returns a single review' do
    client_1 = Client.create!(email: Faker::Internet.email)
    user_1 = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")
    review_1 = Review.create!(
      user: user_1,
      client: client_1,
      rating: Faker::Number.between(from: 1, to: 5),
      safety_meter: Faker::Number.between(from: 1, to: 10)
    )

    query_string = "{ singleReview(id: #{review_1.id}) { rating } }"
    post graphql_path(params: { query: query_string })
    json_response = JSON.parse(@response.body, symbolize_names: true)

    expected = review_1.rating
    actual = json_response[:data][:singleReview][:rating]

    expect(actual).to eq(expected)
  end
end