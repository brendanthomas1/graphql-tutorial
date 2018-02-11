require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, nil)
  end

  test 'creating new user' do
    user = perform(
      name: 'Frank Reynolds',
      authProvider: {
        email: {
          email: 'frank@wolfcola.com',
          password: 'egg'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, 'Frank Reynolds'
    assert_equal user.email, 'frank@wolfcola.com'
  end
end
