class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :name, :role
end
