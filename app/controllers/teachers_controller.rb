class TeachersController < ApplicationController
  def index
    if params[:query].present?
      subject = Subject.find_by(name: params[:query])

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
