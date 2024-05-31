class Submission < ApplicationRecord
  belongs_to :job

  validates :name, :email, :mobile_phone, :resume, :job_id, presence: true
  validates :email, uniqueness: { scope: :job_id, message: "já se candidatou para essa vaga" }
end
