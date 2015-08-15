class SkillUser < ActiveRecord::Base
  SEARCHED = 0
  ACQUIRED = 1

  belongs_to :skill
  belongs_to :user

  validates :skill, presence: true
  validates :user, presence: true
  validates :description, presence: true
  validates :kind, presence: true
end
