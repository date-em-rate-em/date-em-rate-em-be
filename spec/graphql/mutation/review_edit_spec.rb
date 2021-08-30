require 'rails_helper'


RSpec.describe 'edit review', type: :request do
  describe 'mutation: reviewEdit' do
      it 'edits client review' do
        user = User.create!(email: 'testemail@test.com', password: 'testpassword', password_confirmation: 'testpassword')
        client = Client.create!(email: Faker::Internet.email)
        review = Review.create!(
          user: user,
          client: client,
          rating: 4,
          safety_meter: 8
        )

        post graphql_path, params: { query: mutation(review_id: review.id, size: 7, body: "laddy daddy we Like to party") }
        json_response = JSON.parse(@response.body, symbolize_names: true)

        expected = [review.id, 7, "laddy daddy we Like to party"]

        actual = []

        expect(actual).to eq(expected)
      end
    end

    def mutation(user_id:)
        <<~GQL
          mutation {
            reviewCreate(
              userId: #{user_id},
              clientEmail: "clientemail@test.com",
              rating: 3,
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
