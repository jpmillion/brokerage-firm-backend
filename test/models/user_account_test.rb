require "test_helper"

class UserAccountTest < ActiveSupport::TestCase
  test "should not save without user or account type" do
    account = UserAccount.new
    assert_not account.save
  end
end
