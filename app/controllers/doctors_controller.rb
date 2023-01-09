class Api::V1::DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
    render json: @doctors, status: :ok
  end

  def show
    @doctor = Doctor.find(params[:id])
    render json: @doctor
  end

  def create
    # Only the admin user should create the user
    @doctor = Doctor.new(doctor_params)
    @doctor.user_id = params[:user_id]
    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: { error: 'Error creating doctor' }, status: :unprocessable_entity
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    if params[:user_id].to_i == @doctor.user_id
      @doctor.appointments.destroy_all
      @doctor.destroy
      render json: { message: "Doctor #{@doctor.name} deleted!" }, status: :ok
    else
      render json: { error: 'Only the Owner can delete this doctor' }, status: :forbidden
    end
  end

  def show_user_doctors
    @doctors = Doctor.all.where(user_id: params[:id])
    render json: @doctors
  end

  private

  def doctor_params
    params.require(:doctor).permit(:user_id, :name, :specialization, :photo)
  end
end
