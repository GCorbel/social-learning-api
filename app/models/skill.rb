class Skill < ActiveRecord::Base
  validates :name, presence: true

  def self.search(term)
    where("name like :term OR description like :term", term: "%#{term}%")
  end
end
