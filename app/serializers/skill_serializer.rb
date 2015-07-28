class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :acquired_users, :searched_users, :link

  def acquired_users
    object.acquired_user_ids
  end

  def searched_users
    object.searched_user_ids
  end
end
