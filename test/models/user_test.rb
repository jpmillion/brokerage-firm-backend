require "test_helper"

class UserTest < ActiveSupport::TestCase

  test 'should create new user' do 
    user = User.new(email: 'jon@example.com', password: 'password')
    assert user.save
  end

  test 'should not save without valid email or password' do
    # email and password blank
    user1 = User.new
    assert_not user1.save

    # invalid email format
    user2 = User.new(email: 'sdflkdjsklaj', password: 'password')
    assert_not user2.save

    # invalid password length
    user3 = User.new(email: 'jon@example.com', password: 'pass')
    assert_not user3.save
  end
end
