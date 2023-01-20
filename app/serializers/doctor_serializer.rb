class DoctorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :specialization, :photo_dir, :user_id
end
