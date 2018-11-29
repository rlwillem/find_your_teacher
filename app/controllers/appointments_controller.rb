class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where(user_id: current_user.id)
  end

  def show
    @appointment = Appointment.find(params[:id])
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

  def teach
    @appointments = Appointment.where(teacher_id: current_user.teachers)
  end

  def accept
    @appointment = Appointment.find(params[:id])
    @appointment.status = "accepted"
    @appointment.save
    redirect_to teach_path
  end

  def decline
    @appointment = Appointment.find(params[:id])
    @appointment.status = "declined"
    @appointment.save
    redirect_to teach_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date)
  end
end
