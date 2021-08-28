module Types
  class MutationType < Types::BaseObject
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

    #REVIEW
    field :all_reviews, [Types::ReviewType], null: false
    def all_reviews
      Review.all
    end

    field :single_review, Types::ReviewType, null: false do
      argument :id, ID, required: true
    end
    def single_review(id:)
      Review.find(id)
    end
  end
end
