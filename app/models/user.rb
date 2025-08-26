# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  address         :string
#  email           :string           not null
#  image           :string
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
    has_secure_password

    # Validations
    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :created_at, presence: true
    validates :updated_at, presence: true 
    validates :password, length: { minimum: 6}, if: -> { password.present? }
end
