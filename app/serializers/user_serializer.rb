class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :name, :role, :created_at
end
