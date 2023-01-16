class DoctorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :specialization, :photo, :user_id
end
