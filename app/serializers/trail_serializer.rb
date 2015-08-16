class TrailSerializer < ActiveModel::Serializer
  attributes :id, :users, :messages

  def messages
    object.message_ids.reverse
  end

  def users
    object.user_ids
  end
end
