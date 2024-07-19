class EducationSerializer < ActiveModel::Serializer
  attributes :id, :title, :organisation, :start_year, :finish_year
end
