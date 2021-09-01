require 'rails_helper'

RSpec.describe 'client_kindness_average', type: :request  do
  before :each do
    5.times do
      client = Client.create!(email: Faker::Internet.email)
      user = User.create!(email: Faker::Internet.email, password: "test", password_confirmation: "test")
      10.times do
        Review.create!(
            user: user,
            client: client,
            rating: Faker::Number.between(from: 1, to: 5),
            kindness: Faker::Number.between(from: 1, to: 10)
          )
      end
    end
  end

  describe 'field average_kindness' do
    describe 'single client' do
      it 'returns the clients average kindness' do
        post graphql_path(params: { query: single_query(id: Client.first.id) })
        json_response = JSON.parse(@response.body, symbolize_names: true)


        expected = Client.first.reviews.average(:kindness)

        actual = json_response[:data][:singleClient][:averageKindness]

        expect(actual).to eq(expected)
      end
    end

    describe 'all_clients' do
      it 'returns the average kindness of all clients' do
        query_string = "{ allClients { averageKindness } }"
        post graphql_path(params: { query: query_string })
        json_response = JSON.parse(@response.body, symbolize_names: true)


        expected = Client.all.map do |client|
          client.reviews.average(:kindness)
        end

        actual = json_response[:data][:allClients].map do |client|
          client[:averageKindness]
        end
        expect(actual).to eq(expected)
      end
    end
  end

  def single_query(id:)
    <<~GQL
      {
        singleClient(
          id: "#{id}"
        )
        {
          averageKindness
        }
      }
    GQL
  end
end