module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # USER
    field :all_users, [Types::UserType], null: false
    def all_users
      User.all
    end

    field :single_user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def single_user(id:)
      User.find(id)
    end

    # CLIENT
    field :all_clients, [Types::UserType], null: false
    def all_clients
      Client.all
    end

    field :single_client, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def single_client(id:)
      Client.find(id)
    end
  end

  # REVIEWS
end
