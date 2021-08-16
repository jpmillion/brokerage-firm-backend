class User < ApplicationRecord
  validates :email, presence: true
  validates :email, format: { with: /@/ }, uniqueness: { case_sensitive: false }, length: { minimum: 7, maximum: 254 }
  validates :password, length: { minimum: 6 }
  has_secure_password
  has_many :user_accounts
  has_many :account_types, through: :user_accounts

  def self.create_user_for_google(data)
    name =  data['name'].split(' ')                 
    user = User.find_or_create_by(email: data['email']) do |u|
      u.first_name = name[0]
      u.last_name = name[1]
      u.password = SecureRandom.hex(12)
    end
  end 
end
