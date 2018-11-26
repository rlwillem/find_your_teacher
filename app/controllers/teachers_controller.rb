class TeachersController < ApplicationController
  def index
    if params[:category]
      @teachers = Teacher.where(category = params[:category])
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
