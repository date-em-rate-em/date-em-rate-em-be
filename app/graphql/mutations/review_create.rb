module Mutations
  class ReviewCreate < BaseMutation

    argument :user_id, ID, required: true
    argument :client_email, String, required: false
    argument :client_phone, String, required: false
    argument :body, String, required: false
    argument :rating, Integer, required: true
    argument :size, Float, required: false
    argument :payment, Integer, required: false
    argument :vibe, Integer, required: false
    argument :date_again, String, required: false
    argument :safety_meter, Integer, required: true
    argument :gender, String, required: false
    argument :hygiene, Integer, required: false
    argument :duration, Float, required: false
    argument :condoms, String, required: false
    argument :punctuality, String, required: false


    field :review, Types::ReviewType, null: false
    field :user, Types::UserType, null: false
    field :client, Types::ClientType, null: false

    def resolve(
        user_id:,
        client_email: nil,
        client_phone: nil,
        rating:,
        safety_meter:,
        body: nil,
        size: nil,
        payment: nil,
        hygiene: nil,
        punctuality: nil,
        condoms: nil,
        duration: nil,
        vibe: nil,
        date_again: nil,
        gender: nil
      )

      @user = User.find(user_id)
      client_email = nil if client_email == ""
      client_phone = nil if client_phone == ""
      if client_email && client_phone
        if Client.where(email: client_email, phone: client_phone).empty?
          @client = Client.create!(email: client_email, phone: client_phone)
        else
          @client = Client.find_by(email: client_email, phone: client_phone)
        end
      else
        if Client.where(email: client_email).empty? && Client.where(phone: client_phone).empty?
          @client = Client.create!(email: client_email, phone: client_phone)
        else
          @client = Client.find_by(email: client_email) if client_email
          @client = Client.find_by(phone: client_phone) if client_phone
        end
      end

      if size == -1
        size = nil
      end
      if payment == -1
        payment = nil
      end
      if hygiene == -1
        hygiene = nil
      end
      if duration == -1
        duration = nil
      end
      if vibe == -1
        vibe = nil
      end

      @review = Review.new(
        client: @client,
        user: @user,
        body: body,
        rating: rating,
        size: size,
        payment: payment,
        vibe: vibe,
        date_again: date_again,
        safety_meter: safety_meter,
        gender: gender,
        hygiene: hygiene,
        punctuality: punctuality,
        condoms: condoms,
        duration: duration
      )

      if @review.save
        {
          review: @review,
          user: @user,
          client: @client
        }
      else
        raise ActiveRecord::RecordInvalid.new @review
      end
    end
  end
end
