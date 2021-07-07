class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  enum role: ['user', 'admin']

  has_secure_password
end
