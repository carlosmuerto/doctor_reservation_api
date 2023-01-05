class UsersController < ApplicationController
  before_action :authenticate_user!

  def current
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end
end
