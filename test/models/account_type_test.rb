require "test_helper"

class AccountTypeTest < ActiveSupport::TestCase
  test 'should create instance of account type' do
    account_type = AccountType.new(name: 'IRA', description: 'Retirement Account that can be withdrawn from at age 59 and 1/2')
    assert account_type.save
  end
end
