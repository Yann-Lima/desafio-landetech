class Job < ApplicationRecord
  #Associações
  has_many :submissions, dependent: :destroy


  validates :title, presence: true
  validates :description, presence: true
  validates :recruiter_id, presence: true

  belongs_to :recruiter
end
