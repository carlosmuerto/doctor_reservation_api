class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  # validations
  # validate :date_of_appointment_cannot_be_in_the_past
  validates :description, presence: true, length: { in: 3..150 }
  validates :date_of_appointment, presence: true,
                                  inclusion: { in: Date.today..Date.today + 5.years, message: 'Date should be in the future' }
  validates :time_of_appointment, presence: true,
                                  format: { with: /\A\d{2}:\d{2}\z/, message: 'Time format should be HH:MM' }
end
