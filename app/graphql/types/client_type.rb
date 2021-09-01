module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false

    field :reviews, [Types::ReviewType], null: true
    field :average_rating, Float, null: true
    field :average_safety_meter, Float, null: true
    field :average_size, Float, null: true
    field :average_kindness, Float, null: true
    field :average_vibe, Float, null: true

    def average_rating
      self.object.reviews.average(:rating)
    end

    def average_safety_meter
      self.object.reviews.average(:safety_meter)
    end

    def average_size
      self.object.reviews.average(:size)
    end

    def average_kindness
      self.object.reviews.average(:kindness)
    end

    def average_vibe
      self.object.reviews.average(:vibe)
    end
  end
end
