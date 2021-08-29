module Mutations
  class ReviewMutation < BaseMutation

    argument :user_id, ID, required: true
    # argument :client_number, Integer, required: false
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
    argument :gender, String, reqired: false

    type Types::ReviewType

    def resolve(user_id:, client_email:, body:, rating:, title:, size:, payment:, extended_body:, kindness:, vibe:, date_again:, safety_meter:, gender:)
      require 'pry'; binding.pry
      @user = User.find(user_id)
      if Client.where(email: client_email).empty?
        @client = Client.create!(email: client_email)
      else
        @client = Client.find_by(email: client_email)
      end

      @review = Review.new(client: @client, user: @user, body: body, rating: rating, title: title, size: size, payment: payment, extended_body: extended_body, kindness: kindness, vibe: vibe, date_again: date_again, safety_meter: safety_meter)

      @review.save

      {
        review: @review,
        client: @client,
        user: @user
      }
    end
  end
end