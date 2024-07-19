class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :city, :state, :country
  has_many :educations
  has_many :skills
  has_many :links
  has_many :projects
  has_many :overviews
  has_many :jobs
end
