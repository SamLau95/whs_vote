class StudentsController < ApplicationController
  before_filter :signed_in_student,       only: [:show, :index]
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

  def index
    @students = Student.all
  end

  private    
    def correct_student
      @student = Student.find(params[:id])
      redirect_to root_path unless current_student? @student
    end
end
