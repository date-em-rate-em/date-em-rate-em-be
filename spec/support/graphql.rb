module GraphQLHelpers
  def controller
    @controller ||= GraphqlController.new.tap do |obj|
      obj.set_request! ActionDispatch::Request.new({})
    end
  end

  def execute_graphql(query, **kwargs)
    AppSchema.execute(
      query,
      { context: { controller: controller } }.merge(kwargs),
    )
  end
end

RSpec.configure do |c|
  c.include GraphQLHelpers, type: :graphql
end