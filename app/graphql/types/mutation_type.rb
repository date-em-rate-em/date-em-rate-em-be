module Types
  class MutationType < Types::BaseObject
    field :all_users, [Types::UserType], null: false,
      description: "All of the users"
    def all_users
      User.all
    end

  end
end
