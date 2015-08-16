class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :trail_id, :created_at
end
