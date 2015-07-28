class Skill < ActiveRecord::Base
  has_and_belongs_to_many :acquired_users, class_name: 'User',
    join_table: :acquired_skills

  has_and_belongs_to_many :searched_users, class_name: 'User',
    join_table: :searched_skills

  def self.search(term)
    where("name like :term OR description like :term", term: "%#{term}%")
  end
end
