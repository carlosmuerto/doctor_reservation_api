class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    if User.find_by_name(user_params[:name])
      render json: { error: 'Username already exists, please login or use another username to sign up' },
             status: :unauthorized
    else
      @user = User.create(user_params)
      render json: @user, status: :ok
    end
  end

  def login
    if User.find_by_name(user_params[:name])
      @user = User.find_by_name(user_params[:name])
      render json: @user, status: :accepted
    else
      render json: { error: 'Username does not exists, please sign up' }, status: :not_found
    end
  end

  def current
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end
end
