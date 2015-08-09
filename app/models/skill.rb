class Skill < ActiveRecord::Base
  def self.search(term)
    where("name like :term OR description like :term", term: "%#{term}%")
  end
end
