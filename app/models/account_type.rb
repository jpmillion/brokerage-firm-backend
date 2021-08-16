class AccountType < ApplicationRecord
    has_many :user_accounts
    has_many :users, through: :user_accounts
end
