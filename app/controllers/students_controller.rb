class StudentsController < ApplicationController
  before_filter :signed_in_student, only: [:show]
  before_filter :correct_student,   only: [:show]
  before_filter :admin_student,     only: [:new, :create, :index, :destroy]
  before_filter :not_same_student,  only: [:destroy]

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
    @students = Student.paginate(page: params[:page])
  end

  def destroy
    Student.find(params[:id]).destroy
    flash[:success] = 'Student deleted.'
    redirect_to students_url
  end

  private   
    def signed_in_student
      unless signed_in?
        store_location
        redirect_to signin_url, notice: 'Please sign in.'
      end
    end 

    def correct_student
      @student = Student.find(params[:id])
      redirect_to root_path unless current_student? @student
    end

    def admin_student
      redirect_to root_path unless current_student && current_student.admin?
    end

    def not_same_student
      redirect_to root_path unless !current_student? Student.find(params[:id])
    end
end

