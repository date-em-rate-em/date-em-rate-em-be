require 'rails_helper'

RSpec.describe 'client_email', type: :request  do
  it 'returns a client by email' do
    client_1 = Client.create!(email: "testicle@test.com")

    post graphql_path(params: { query: query(email: client_1.email) })
    json_response = JSON.parse(@response.body, symbolize_names: true)

    expected = [client_1.id, client_1.email]
    actual = [json_response[:data][:clientEmail][0][:id].to_i,
            json_response[:data][:clientEmail][0][:email]]

    expect(actual).to eq(expected)
  end

  def query(email:)
    <<~GQL
      query{
        clientEmail(
          email: "#{email}"
        )
        {
          id
          email
        }
      }
    GQL
  end
end
