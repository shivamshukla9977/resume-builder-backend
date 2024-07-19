class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :duration
end
