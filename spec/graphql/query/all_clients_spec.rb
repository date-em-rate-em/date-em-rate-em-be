require 'rails_helper'

RSpec.describe 'all_clients', type: :request  do
  it 'returns all clients' do
    5.times do
      Client.create!(email: Faker::Internet.email)
    end

    query_string = "{ allClients { email } }"
    post graphql_path(params: { query: query_string })
    json_response = JSON.parse(@response.body, symbolize_names: true)

    expected = Client.all.pluck(:email)
    actual = json_response[:data][:allClients].map do |client|
      client[:email]
    end

    expect(actual).to eq(expected)
  end
end
