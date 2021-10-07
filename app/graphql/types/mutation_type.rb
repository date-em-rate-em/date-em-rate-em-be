module Types
  class MutationType < Types::BaseObject
    field :review_create, mutation: Mutations::ReviewCreate
    field :user_create, mutation: Mutations::UserCreate
    field :review_edit, mutation: Mutations::ReviewEdit
    field :sign_in, mutation: Mutations::SignIn
  end
end
