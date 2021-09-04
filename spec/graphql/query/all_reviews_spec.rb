require 'rails_helper'

RSpec.describe 'all_reviews', type: :request  do
  before :each do
    5.times do
      client = Client.create!(email: Faker::Internet.email)
      user = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")
      Review.create!(
        user: user,
        client: client,
        rating: Faker::Number.between(from: 1, to: 5),
        safety_meter: Faker::Number.between(from: 1, to: 10)
      )
    end
  end
  it 'returns all reviews' do
    post graphql_path(params: { query: query })
    json_response = JSON.parse(@response.body, symbolize_names: true)

    expected = Review.all.pluck(:rating)
    actual = json_response[:data][:allReviews].map do |review|
      review[:rating]
    end
    
    expect(actual.sort!).to eq(expected.sort!)
  end

  def query
    <<~GQL
      {
        allReviews
        {
          rating
        }
      }
    GQL
  end
end