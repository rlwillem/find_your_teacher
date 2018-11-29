class SubjectsController < ApplicationController
  def index
    if params[:query].present?
      subjects = Subject.where("name ILIKE ?", "%#{params[:query]}%")
      @teachers = []
      subjects.each do |subject|
        @subject = subject
        @teachers << subject.teachers
      end
      @teachers = @teachers.flatten
    else
      @teachers = Teacher.all
    end
  end
end
