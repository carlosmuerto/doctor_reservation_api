class DoctorsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # @doctors = Doctor.all
    render json: @doctors.map { |doc| DoctorSerializer.new(doc).serializable_hash[:data][:attributes] }, status: :ok
  end

  def show
    # @doctor = Doctor.find(params[:id])
    render json: DoctorSerializer.new(@doctor).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    # Only the admin user should create the user
    @doctor = Doctor.new(doctor_params)
    @doctor.user = current_user
    if @doctor.save
      render json: DoctorSerializer.new(@doctor).serializable_hash[:data][:attributes], status: :created
    else
      render json: { error: 'Error creating doctor' }, status: :unprocessable_entity
    end
  end

  def update
    # @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      render json: DoctorSerializer.new(@doctor).serializable_hash[:data][:attributes], status: :ok
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy
    render json: { message: "Doctor #{@doctor.name} deleted!" }, status: :no_content
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :photo)
  end
end
