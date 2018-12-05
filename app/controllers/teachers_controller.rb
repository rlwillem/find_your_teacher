require "selenium-webdriver"

class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
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
     driver = Selenium::WebDriver.for :chrome

    driver.navigate.to "https://www.inaturalist.org/computer_vision_demo"
    file =  @teacher.picture.file.file

    button = driver.find_element(:xpath => "//*[@id='app']/div/div/input")
    button.send_key file
    classify = driver.find_element(:class => "classify")
    sleep(2)
    classify.click
    driver.quit
    if @teacher.save
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def edit
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
