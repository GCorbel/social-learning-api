class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :skill_users

  def skill_users
    object.skill_user_ids
  end
end
