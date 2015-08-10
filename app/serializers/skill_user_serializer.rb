class SkillUserSerializer < ActiveModel::Serializer
  attributes :id, :description, :user, :skill, :kind, :user_id, :skill_id

  def user
    object.user_id
  end

  def skill
    object.skill_id
  end
end
