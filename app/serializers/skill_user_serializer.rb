class SkillUserSerializer < ActiveModel::Serializer
  attributes :id, :description, :user, :skill, :kind

  def user
    object.user_id
  end

  def skill
    object.skill_id
  end
end
