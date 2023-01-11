class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  # validations

  # validate :datetime_of_appointment_cannot_be_in_the_past
  validates :description, presence: true, length: { in: 3..150 }
  validates :datetime_of_appointment,
            presence: true,
            inclusion: {
              in: Date.today..Date.today + 5.years,
              message: 'Date should be in the future and no more that 5 years'
            }
end
