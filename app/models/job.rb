class Job < ApplicationRecord
  belongs_to :recruiter

  validates :title, :description, :recruiter_id, presence: true
end
