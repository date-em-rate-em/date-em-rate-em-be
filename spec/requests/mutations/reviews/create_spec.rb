require 'rails_helper'


    RSpec.describe 'create review' do
      describe 'mutation: reviewMutation' do
        describe 'client does not exist' do
          it 'creates client and review' do
            @user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')


            post graphql_path, params: { query: mutation(user_id: @user.id) }
            json_response = JSON.parse(@response.body, symbolize_names: true)

            expected = [@user.id, Review.first.client_id, Review.first.id]

            actual = [
              json_response[:data][:reviewMutation][:userId],
              json_response[:data][:reviewMutation][:clientId],
              json_response[:data][:reviewMutation][:id].to_i
            ]

            expect(actual).to eq(expected)
          end
        end
        describe 'client does exist' do
          it 'creates review and assigns to client' do
            @user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')
            @client = Client.create!(email: 'clientemail@test.com')

            post graphql_path, params: { query: mutation(user_id: @user.id) }
            json_response = JSON.parse(@response.body, symbolize_names: true)

            expected = [@user.id, @client.id, Review.first.id]

            actual = [
              json_response[:data][:reviewMutation][:userId],
              json_response[:data][:reviewMutation][:clientId],
              json_response[:data][:reviewMutation][:id].to_i
            ]

            expect(actual).to eq(expected)
          end
        end

        def mutation(user_id:)
            <<~GQL
              mutation {
                reviewMutation(
                  userId: #{user_id},
                  clientEmail: "clientemail@test.com",
                  rating: 3,
                  safetyMeter: 9
                )
                {
                  userId,
                  clientId,
                  id
                }
              }
            GQL
        end
      end
    end
