class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :skills

  def skills
    object.skill_ids
  end
end
