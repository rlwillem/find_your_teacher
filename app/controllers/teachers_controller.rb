class TeachersController < ApplicationController
  def index
    if params[:query].present?
      lowercase = params[:query]
      subject = Subject.find_by(name: lowercase.downcase)

      @teachers = subject.teachers
    else
      @teachers = Teacher.all
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def delete
  end

end
