class StudentsController < ApplicationController

  def index
    # byebug
    students = if params[:name]
      # byebug
      Student.where('lower(first_name) = lower(?)', params[:name]).or(Student.where('lower(last_name) = lower(?)', params[:name]))
    else
      Student.all
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
