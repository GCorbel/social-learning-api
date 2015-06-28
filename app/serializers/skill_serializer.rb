class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :users

  def users
    object.user_ids
  end
end
