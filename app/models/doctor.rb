class Doctor < ApplicationRecord
  belongs_to :user
  has_many :appointments

  # validations
  validates :name, presence: true, length: { in: 3..50 }
  validates :specialization, presence: true, length: { in: 3..50 }
  validates :photo, presence: true
end
