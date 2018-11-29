class TeachersController < ApplicationController
  def index
    if params[:query].present?
      lowercase = params[:query].downcase.capitalize
      subject = Subject.find_by(name: lowercase)
      # subject = Subject.where("name ILIKE ?", lowercase)
      @teachers = subject.teachers
      # ("title ILIKE ?", "%#{params[:query]}%")
    else
      @teachers = Teacher.all
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    @appointment = Appointment.new
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.user = current_user
    if @teacher.save
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def edit
    raise
    @teacher = Teacher.find(params)
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  def delete
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :description, :subject_id, :picture, :rate, :rating)
  end
end
