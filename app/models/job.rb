class Job < ApplicationRecord
  belongs_to :user

  validates :title, :company_name, :start_from, :job_type, presence: true
end
