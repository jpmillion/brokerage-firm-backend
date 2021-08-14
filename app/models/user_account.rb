class UserAccount < ApplicationRecord
  belongs_to :account_type
  belongs_to :user
end
