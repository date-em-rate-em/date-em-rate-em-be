module Mutations
  class ReviewCreate < BaseMutation

    argument :user_id, ID, required: true
    argument :client_email, String, required: false
    argument :body, String, required: false
    argument :rating, Integer, required: true
    argument :title, String, required: false
    argument :size, Float, required: false
    argument :payment, Integer, required: false
    argument :extended_body, String, required: false
    argument :kindness, Integer, required: false
    argument :vibe, Integer, required: false
    argument :date_again, Integer, required: false
    argument :safety_meter, Integer, required: true
    argument :gender, String, required: false

    field :review, Types::ReviewType, null: false
    field :user, Types::UserType, null: false
    field :client, Types::ClientType, null: false


    def resolve(
        user_id:,
        client_email:,
        rating:,
        safety_meter:,
        body: nil,
        title: nil,
        size: nil,
        payment: nil,
        extended_body: nil,
        kindness: nil,
        vibe: nil,
        date_again: nil,
        gender: nil)

      @user = User.find(user_id)
      if Client.where(email: client_email).empty?
        @client = Client.create!(email: client_email)
      else
        @client = Client.find_by(email: client_email)
      end

      @review = Review.create!(client: @client, user: @user, body: body, rating: rating, title: title, size: size, payment: payment, extended_body: extended_body, kindness: kindness, vibe: vibe, date_again: date_again, safety_meter: safety_meter)

      @review.save

      {
        review: @review,
        user: @user,
        client: @client
      }

    end
  end
end
