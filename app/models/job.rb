class Job < ApplicationRecord
  belongs_to :user

  validates :title, :company_name, :start_from, :type, presence: true
end
