class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def self.roles
    %w[user admin].freeze
  end

  User.roles.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end

  validates :name, presence: true
  validates :role, inclusion: { in: User.roles }
end
