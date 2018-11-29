class SubjectsController < ApplicationController
  def index
    if params[:query].present?
      subjects = Subject.where("name ILIKE ?", "%#{params[:query]}%")
      @teachers = []
      subjects.each do |subject|
        @teachers << subject.teachers
      end
      @teachers = @teachers.flatten
    end
  end
end
