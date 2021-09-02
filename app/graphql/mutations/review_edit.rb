module Mutations
  class ReviewEdit < BaseMutation

    argument :review_id, ID, required: true
    argument :body, String, required: false
    argument :title, String, required: false
    argument :size, Float, required: false
    argument :payment, Integer, required: false
    argument :extended_body, String, required: false
    argument :kindness, Integer, required: false
    argument :vibe, Integer, required: false
    argument :date_again, Integer, required: false
    argument :gender, String, required: false

    field :review, Types::ReviewType, null: true
    field :user, Types::UserType, null: true
    field :client, Types::ClientType, null: true
    field :error, Types::ErrorType, null: true

    def resolve(
        review_id:,
        body: nil,
        title: nil,
        size: nil,
        payment: nil,
        extended_body: nil,
        kindness: nil,
        vibe: nil,
        date_again: nil,
        gender: nil
      )

      review = Review.find(review_id)
      client = Client.find(review.client_id)
      user = User.find(review.user_id)
      body ||= review.body
      title ||= review.title
      gender ||= review.gender
      size ||= review.size
      payment ||= review.payment
      extended_body ||= review.extended_body
      kindness ||= review.kindness
      vibe ||= review.vibe
      date_again ||= review.date_again
      gender ||= review.gender

      review.update!(
        body: body,
        title: title,
        size: size,
        payment: payment,
        extended_body: extended_body,
        kindness: kindness,
        vibe: vibe,
        date_again: date_again
      )

      {
        review: review,
        user: user,
        client: client
      }
    rescue ActiveRecord::RecordNotFound
      error = Error.new(
        message: 'Could not find a review with that ID',
        status: 404
      )
      { 
        error: error
      }
    rescue ActiveRecord::RecordInvalid => e
      error = Error.new(
        message: e.message,
        status: 405
      )
      {
        error: error
      }
    end
  end
end
