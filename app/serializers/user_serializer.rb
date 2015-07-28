class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :acquired_skills, :searched_skills

  def acquired_skills
    object.acquired_skill_ids
  end

  def searched_skills
    object.searched_skill_ids
  end
end
