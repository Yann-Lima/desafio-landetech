class Submission < ApplicationRecord
  belongs_to :job

  validates :email, uniqueness: { scope: :job_id, message: "já está cadastrado para esta vaga" }
end
