module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # USER -----------------------------------------------

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

    # CLIENT -----------------------------------------------

      field :all_clients, [Types::ClientType], null: false
      def all_clients
        Client.all
      end

      field :single_client, Types::ClientType, null: false do
        argument :id, ID, required: true
      end
      def single_client(id:)
        Client.find(id)
      end

      field :client_email, [Types::ClientType], null: false do
        argument :email, String, required: true
      end
      def client_email(email:)
        Client.where("email ILIKE ?", "%#{email}%")
      end

    # REVIEWS -----------------------------------------------

      field :all_reviews, [Types::ReviewType], null: false do
        argument :order_by, String, required: false
      end
      def all_reviews(order_by:)
        order_by = 'id' if order_by.empty?
        Review.order("#{order_by} DESC, id")
      end

      field :single_review, Types::ReviewType, null: false do
        argument :id, ID, required: true
      end
      def single_review(id:)
        Review.find(id)
      end
  end
end
