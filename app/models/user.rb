class User < ActiveRecord::Base
  include Clearance::User

  has_and_belongs_to_many :acquired_skills, class_name: 'Skill',
    join_table: :acquired_skills
  has_and_belongs_to_many :searched_skills, class_name: 'Skill',
    join_table: :searched_skills
end
