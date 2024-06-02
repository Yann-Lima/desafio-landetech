class Recruiter < ApplicationRecord
  # Associações
  has_many :jobs
  has_secure_password
  has_many :jobs, dependent: :destroy

  # Validações
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?

  # Método para autenticar um recrutador
  def self.authenticate(email, password)
    recruiter = find_by(email: email)
    return nil unless recruiter
    return recruiter if recruiter.password == password
  end
end
