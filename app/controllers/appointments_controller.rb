class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.where(user_id: current_user.id)
  end

end