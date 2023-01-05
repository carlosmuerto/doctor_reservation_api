class UsersController < ApplicationController
  before_action :authenticate_user!

  def current
    # render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
    render json: current_user, status: :ok
  end
end
