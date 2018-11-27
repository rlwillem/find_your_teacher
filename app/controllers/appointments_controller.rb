class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.where(user_id: current_user.id)
  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.teacher = Teacher.find(params[:teacher_id])
    @appointment.user = current_user
    @appointment.save
    redirect_to appointments_path
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date)
  end
end
