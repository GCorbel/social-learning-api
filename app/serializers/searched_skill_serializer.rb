class SearchedSkillSerializer < ActiveModel::Serializer
  attributes :id, :description, :user, :skill

  def user
    object.user_id
  end

  def skill
    object.skill_id
  end
end
