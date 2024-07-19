class User < ApplicationRecord
  has_many :educations
  has_many :skills
  has_many :links
  has_many :projects
  has_many :overviews
  has_many :jobs

  validates :first_name, :last_name, :email, :city, :state, :country, presence: true
end
