require "test_helper"

class UserAccountTest < ActiveSupport::TestCase
  account_type = AccountType.create(name: 'IRA', description: 'Retirement Account')
  user = User.create(email: 'jan@example.com', password: 'ldska;fjsd;lafj')

  test "should create user account" do
    account = UserAccount.new
    account_type.user_accounts << account
    user.user_accounts << account
    assert account.valid?
  end

  test "should not save without user or account type" do
    account1 = UserAccount.new
    account_type.user_accounts << account1
    assert_not account1.valid?

    account2 = UserAccount.new
    user.user_accounts << account2
    assert_not account2.valid?
  end
end
