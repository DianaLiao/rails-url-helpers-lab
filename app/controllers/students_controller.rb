class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student
    if @student.active == true
      @student_status = "active"
    elsif @student.active == false
      @student_status = "inactive"
    end
  end

  def activate
    set_student
    @student.toggle!(:active)
    # @student.save
    redirect_to action: "show"
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end