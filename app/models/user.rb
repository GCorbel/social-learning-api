class User < ActiveRecord::Base
  include Clearance::User

  attr_accessor :password_confirmation

  validates :email, confirmation: true
  validates :password_confirmation, presence: true

  has_many :skill_users
end
