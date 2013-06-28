class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new params[:student]
    if @student.save
      sign_in @student
      flash[:success] = 'Student created!'
      redirect_to @student
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end
end
