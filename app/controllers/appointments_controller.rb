class AppointmentsController < ApplicationController
  # before_action :set_appointment, only: %i[show update destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /appointments  AppointmentSerializer
  def index
    # Lists all the appointments
    # @appointments = Appointment.all
    render json: @appointments.map { |appo|
                   AppointmentSerializer.new(appo).serializable_hash[:data][:attributes]
                 }, status: :ok
  end

  # POST users/:id/appointments
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if @appointment.save
      render json: AppointmentSerializer.new(@appointment).serializable_hash[:data][:attributes], status: :created
    else
      render json: { error: 'Error creating appointment' }, status: :unprocessable_entity
    end
  end

  # GET /appointments/1
  def show
    render json: AppointmentSerializer.new(@appointment).serializable_hash[:data][:attributes], status: :ok
  end

  # PATCH/PUT /appointments/1
  def update
    @appointment.update(appointment_params)
    if @appointment.save
      render json: AppointmentSerializer.new(@appointment).serializable_hash[:data][:attributes], status: :ok
    else
      render json: { error: 'Error updating appointment' }, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    render json: { message: 'Appointment deleted!' }, status: :no_content
  end

  private

  # def set_appointment
  #   @appointment = Appointment.find(params[:id])
  # end

  def appointment_params
    params.require(:appointment).permit(:datetime_of_appointment, :description, :doctor_id)
  end
end
