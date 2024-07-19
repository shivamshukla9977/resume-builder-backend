class Project < ApplicationRecord
  belongs_to :user

  validates :title, :description, :duration, presence: true
end
