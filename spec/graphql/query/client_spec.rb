require 'rails_helper'

RSpec.describe 'single_client', type: :request  do
  it 'returns a single client' do
    client_1 = Client.create!(email: Faker::Internet.email)

    query_string = "{ singleClient(id: #{client_1.id}) { email } }"
    post graphql_path(params: { query: query_string })
    json_response = JSON.parse(@response.body, symbolize_names: true)

    expected = client_1.email
    actual = json_response[:data][:singleClient][:email]

    expect(actual).to eq(expected)
  end
end
