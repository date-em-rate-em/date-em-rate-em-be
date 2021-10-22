require 'rails_helper'

RSpec.describe 'associated clients', type: :request do
  describe 'client with single attribute' do
    it 'returns associated clients' do
      DatabaseCleaner.clean
      client_1 = Client.create!(email: 'test@test.com')
      client_2 = Client.create!(email: 'test@test.com', phone: '304957')

      post graphql_path(params: { query: single_query(id: client_1.id) })
      json_response = JSON.parse(response.body, symbolize_names: true)

      actual = json_response[:data][:singleClient][:associatedClients][0][:id].to_i
      expected = client_2.id

      expect(actual).to eq(expected)
    end
  end
  def single_query(id:)
    <<~GQL
      {
        singleClient(
          id: "#{id}"
        )
        {
          associatedClients{
            id
          }
        }
      }
    GQL
  end
end
