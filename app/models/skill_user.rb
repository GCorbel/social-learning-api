class SkillUser < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user

  SEARCHED = 0
  ACQUIRED = 1
end
