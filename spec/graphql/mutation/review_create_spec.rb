require 'rails_helper'


RSpec.describe 'create review', type: :request do
  describe 'mutation: reviewCreate' do
    describe 'create client by email' do
      describe 'client does not exist' do
        it 'creates client and review' do
          @user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')


          post graphql_path, params: { 
            query: mutation(
              user_id: @user.id, 
              rating: 3, 
              email: 'clientemail@test.com',
              phone: nil) 
            }
          json_response = JSON.parse(@response.body, symbolize_names: true)

          expected = [@user.id, Review.first.client_id, Review.first.id]

          actual = [
            json_response[:data][:reviewCreate][:user][:id].to_i,
            json_response[:data][:reviewCreate][:client][:id].to_i,
            json_response[:data][:reviewCreate][:review][:id].to_i
          ]

          expect(actual).to eq(expected)
        end
      end
      describe 'client does exist' do
        it 'creates review and assigns to client' do
          @user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')
          @client = Client.create!(email: 'clientemail@test.com')

          post graphql_path, params: { 
            query: mutation(
              user_id: @user.id, 
              rating: 3, 
              email: 'clientemail@test.com',
              phone: nil) 
            }
          json_response = JSON.parse(@response.body, symbolize_names: true)

          expected = [@user.id, @client.id, Review.first.id]

          actual = [
            json_response[:data][:reviewCreate][:user][:id].to_i,
            json_response[:data][:reviewCreate][:client][:id].to_i,
            json_response[:data][:reviewCreate][:review][:id].to_i
          ]

          expect(actual).to eq(expected)
        end
      end
    end

    describe 'create client by phone number' do
      describe 'client does not exist' do
        it 'creates client and review' do
          @user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')


          post graphql_path, params: { 
            query: mutation(
              user_id: @user.id, 
              rating: 3, 
              email: nil,
              phone: 5555555555) 
            }
          json_response = JSON.parse(@response.body, symbolize_names: true)

          expected = [@user.id, Review.first.client_id, Review.first.id]

          actual = [
            json_response[:data][:reviewCreate][:user][:id].to_i,
            json_response[:data][:reviewCreate][:client][:id].to_i,
            json_response[:data][:reviewCreate][:review][:id].to_i
          ]

          expect(actual).to eq(expected)
        end
      end
      describe 'client does exist' do
        it 'creates review and assigns to client' do
          @user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')
          @client = Client.create!(phone: 5555555555)

          post graphql_path, params: { 
            query: mutation(
              user_id: @user.id, 
              rating: 3, 
              email: nil,
              phone: 5555555555) 
            }
          json_response = JSON.parse(@response.body, symbolize_names: true)

          expected = [@user.id, @client.id, Review.first.id]

          actual = [
            json_response[:data][:reviewCreate][:user][:id].to_i,
            json_response[:data][:reviewCreate][:client][:id].to_i,
            json_response[:data][:reviewCreate][:review][:id].to_i
          ]

          expect(actual).to eq(expected)
        end
      end
    end

    describe 'review does not save' do
      it 'does not save' do
        @user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')
        @client = Client.create!(email: 'clientemail@test.com')

        post graphql_path, params: { 
          query: mutation(
            user_id: @user.id, 
            rating: 8, 
            email: 'clientemail@test.com',
            phone: nil) 
          }
        json_response = JSON.parse(@response.body, symbolize_names: true)

        actual = [json_response[:errors][0][:message], response.status]
        expected = ["Validation failed: Rating must be less than or equal to 5", 405]

        expect(actual).to eq(expected)
      end
    end

    def mutation(user_id:, rating:, email:, phone:)
        <<~GQL
          mutation {
            reviewCreate(
              userId: #{user_id},
              clientPhone: "#{phone}",
              clientEmail: "#{email}",
              rating: #{rating},
              safetyMeter: 9
            )
            {
              review{
                id
              }
              user{
                id
              }
              client{
                id
              }
            }
          }
        GQL
    end
  end
end
