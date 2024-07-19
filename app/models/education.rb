class Education < ApplicationRecord
  belongs_to :user

  validates :title, :organisation, :start_year, :finish_year, presence: true
end
