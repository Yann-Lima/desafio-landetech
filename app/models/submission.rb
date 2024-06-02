class Submission < ApplicationRecord
  belongs_to :job

  validates :emailCandidato, uniqueness: { scope: :job_id, message: "já está cadastrado para esta vaga" }
  validates :emailCandidato, format: { with: URI::MailTo::EMAIL_REGEXP, message: "formato de e-mail inválido" }

  validates :nameCandidato, :emailCandidato, :phoneCandidato, presence: true

  #validates :phoneCandidato, format: { with: /\A\(\d{2}\) \d{4,5}-\d{4}\z/, message: "formato de telefone inválido" }, allow_blank: true

end
