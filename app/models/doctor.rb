class Doctor < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_one_attached :image

  # validations
  validates :name, presence: true, length: { in: 3..50 }
  validates :specialization, presence: true, length: { in: 3..50 }
end
