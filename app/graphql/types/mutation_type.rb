module Types
  class MutationType < Types::BaseObject
    field :review_create, mutation: Mutations::ReviewCreate
  end
end
