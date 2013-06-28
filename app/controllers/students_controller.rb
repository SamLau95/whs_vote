class StudentsController < ApplicationController
  def create
  end

  def show
    @student = Student.find(params[:id])
  end
end
