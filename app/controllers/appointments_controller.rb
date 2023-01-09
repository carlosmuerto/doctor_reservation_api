class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]

  # GET users/:id/appointments
  def index
    # List the appointments for a specific user
    @appointments = Appointment.all.where(user_id: params[:user_id])
    render json: @appointments, status: :ok
  end

  # GET /appointments
  def show_all
    # Lists all the appointments
    @appointments = Appointment.all
    render json: @appointments, status: :ok
  end

  # POST users/:id/appointments
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = params[:user_id]
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: { error: 'Error creating appointment' }, status: :unprocessable_entity
    end
  end

  # POST doctors/:id/appointments
  def create_on_doctors
    @appointment = Appointment.new(appointment_params)
    @appointment.doctor_id = params[:id]
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: { error: 'Error creating appointment' }, status: :unprocessable_entity
    end
  end

  # GET /appointments/1
  def show
    render json: @appointment, status: :ok
  end

  # PATCH/PUT /appointments/1
  def update
    @appointment.update(appointment_params)
    if @appointment.save
      render json: @appointment, status: :ok
    else
      render json: { error: 'Error updating appointment' }, status: :unprocessable_entity
    end
  end

  # DELETE users/1/appointments/1
  def destroy
    if params[:user_id].to_i == @appointment.user_id
      @appointment.destroy
      render json: { message: "Your appointment with doctor: #{@appointment.doctor.name} canceled!" }
    else
      render json: { error: 'Only the Client  can cancel this appointment' }, status: :forbidden
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:user_id, :date_of_appointment, :time_of_appointment, :description, :doctor_id)
  end
end
