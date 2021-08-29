require 'rails_helper'


RSpec.describe 'create review' do
  describe 'mutation: reviewMutation' do
    describe 'client does not exist' do
      it 'creates client and review' do
        @user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')


        post graphql_path, params: { mutation: mutation(user_id: @user.id) }
        json_response = JSON.parse(@response.body, symbolize_names: true)

        expected = [Review.first, Review.first.user_id, Review.first.client_id]

        actual = [json_response[:data][:reviewMutation][:review], json_response[:data][:reviewMutation][:user][:id], json_response[:data][:reviewMutation][:client][:id]]

        require 'pry'; binding.pry
        expect(actual).to eq(expected)
      end
    end

    def mutation(user_id:)
        <<~GQL
          mutation {
            reviewMutation(
              user_id: #{user_id},
              client_email: clientemail@test.com,
              rating: 3,
              safety_meter: 9
            )
            {
              user,
              client,
              review
            }
          }
        GQL
    end
  end
end
