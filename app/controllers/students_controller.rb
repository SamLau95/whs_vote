class StudentsController < ApplicationController
  before_filter :signed_in,       only: [:show]
  before_filter :correct_student, only: [:show]

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

  private
    def signed_in
      redirect_to signin_url, notice: 'Please sign in.' unless signed_in?
    end
    
    def correct_student
      @student = Student.find(params[:id])
      redirect_to root_path unless current_student? @student
    end
end
