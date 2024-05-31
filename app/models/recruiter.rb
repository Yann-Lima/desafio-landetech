class Recruiter < ApplicationRecord
  has_many :jobs
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
