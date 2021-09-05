module Mutations
  class ReviewEdit < BaseMutation

    argument :review_id, ID, required: true
    argument :body, String, required: false
    argument :size, Float, required: false
    argument :payment, Integer, required: false
    argument :vibe, Integer, required: false
    argument :date_again, String, required: false
    argument :gender, String, required: false
    argument :hygiene, Integer, required: false
    argument :duration, Integer, required: false
    argument :condoms, String, required: false
    argument :punctuality, String, required: false

    field :review, Types::ReviewType, null: true
    field :user, Types::UserType, null: true
    field :client, Types::ClientType, null: true

    def resolve(
        review_id:,
        body: nil,
        size: nil,
        payment: nil,
        date_again: nil,
        punctuality: nil,
        condoms: nil,
        duration: nil,
        vibe: nil,
        hygiene: nil,
        gender: nil
      )

      review = Review.find(review_id)
      client = Client.find(review.client_id)
      user = User.find(review.user_id)
      body ||= review.body
      gender ||= review.gender
      size ||= review.size
      payment ||= review.payment
      vibe ||= review.vibe
      date_again ||= review.date_again
      gender ||= review.gender
      hygiene ||= review.hygiene
      duration ||= review.duration
      condoms ||= review.condoms
      punctuality ||= review.punctuality


      review.update!(
        body: body,
        size: size,
        payment: payment,
        vibe: vibe,
        date_again: date_again,
        hygiene: hygiene,
        punctuality: punctuality,
        condoms: condoms,
        duration: duration,
        gender: gender
      )

      {
        review: review,
        user: user,
        client: client
      }
    end
  end
end
