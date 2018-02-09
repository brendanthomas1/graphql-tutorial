class Resolvers::CreateLink < GraphQL::Function
  # arguments passed in as 'args'
  argument :description, !types.String
  argument :url, !types.String

  # return type from the mutation
  type Types::LinkType

  # mutation method
  # _obj is the parent element (nil in this case)
  # _ctx is the GraphQL context
  def call(_obj, args, _ctx)
    Link.create! description: args[:description], url: args[:url]
  end
end

