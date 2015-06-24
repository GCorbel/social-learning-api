class User < ActiveRecord::Base
  include Clearance::User

  has_many :skills, through: :skill_users
  has_many :skill_users
end
