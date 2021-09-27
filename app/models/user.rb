class User < ApplicationRecord
  ROLES = {
    client: 0,
    admin: 1
  }.freeze

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  enum role: ROLES
end
