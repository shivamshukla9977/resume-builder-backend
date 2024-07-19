class Overview < ApplicationRecord
  belongs_to :user

  validates :title, :summary, presence: true
end
