module Types
  class MutationType < Types::BaseObject
    field :review_create, mutation: Mutations::ReviewCreate
    field :user_create, mutation: Mutations::UserCreate
  end
end
