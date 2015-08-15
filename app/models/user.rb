class User < ActiveRecord::Base
  include Clearance::User

  attr_accessor :password_confirmation

  validates :nickname, presence: true
  validates :email, presence: true

  validates :password, presence: true, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  has_many :skill_users
end
