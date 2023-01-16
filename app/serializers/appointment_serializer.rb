class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :doctor_id, :description, :datetime_of_appointment, :created_at
end
