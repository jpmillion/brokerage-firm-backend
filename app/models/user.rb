class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: /@/ }, uniqueness: { case_sensitive: false }, length: { minimum: 7, maximum: 254 }
  validates :password, length: { in: 6..20 }
  has_secure_password
end
