class User < ActiveRecord::Base
  include Clearance::User

  attr_accessor :password_confirmation

  validates :email, confirmation: true
  validates :password_confirmation, presence: true

  has_and_belongs_to_many :acquired_skills, class_name: 'Skill',
    join_table: :acquired_skills
  has_and_belongs_to_many :searched_skills, class_name: 'Skill',
    join_table: :searched_skills
end
