class Skill < ActiveRecord::Base
  has_many :users, through: :skill_users
  has_many :skill_users

  def self.search(term)
    where("name like :term OR description like :term", term: "%#{term}%")
  end
end
