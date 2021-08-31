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
    post graphql_path(params: { query: query(order_by: nil) })
    json_response = JSON.parse(@response.body, symbolize_names: true)

    expected = Review.all.pluck(:rating)
    actual = json_response[:data][:allReviews].map do |review|
      review[:rating]
    end
    
    expect(actual.sort!).to eq(expected.sort!)
  end
  describe 'order_by' do
    describe 'rating' do
      it 'returns the reviews ordered by ratings' do
        post graphql_path(params: { query: query(order_by: 'rating') })
        json_response = JSON.parse(@response.body, symbolize_names: true)

        
        expected = Review.all.pluck(:rating).sort!.reverse!
        actual = json_response[:data][:allReviews].map do |review|
          review[:rating]
        end
        expect(actual).to eq(expected)
      end
    end
    describe 'safety_meter' do
      it 'returns the reviews ordered by safety_meter' do
        post graphql_path(params: { query: query(order_by: 'safety_meter') })
        json_response = JSON.parse(@response.body, symbolize_names: true)

        
        expected = Review.order("safety_meter DESC, id").pluck(:rating)
        actual = json_response[:data][:allReviews].map do |review|
          review[:rating]
        end
        expect(actual).to eq(expected)
      end
    end
  end
  def query(order_by:)
    <<~GQL
      {
        allReviews(
          orderBy: "#{order_by}"
        )
        {
          rating
        }
      }
    GQL
end
end