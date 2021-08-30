module Types
  class MutationType < Types::BaseObject
    field :review_mutation, mutation: Mutations::ReviewMutation
  end
end
