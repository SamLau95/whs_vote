class StudentsController < ApplicationController
  before_filter :signed_in_student,        only: [:show]
  before_filter :correct_student_or_admin, only: [:show]
  before_filter :admin_student,            only: [:new, :create, :index, :destroy]
  before_filter :not_same_student,         only: [:destroy]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new params[:student]
    if @student.save # successful creation
      sign_in @student
      flash[:success] = 'Student created!'
      redirect_to @student
    else
      render 'new'
    end
  end

  def show
    @student = Student.find params[:id]
    if @student.votes.any?
      @votes = @student.votes
    else
      @categories = AsbCategory.categories_for(@student) + GradeCategory.categories_for(@student)
    end
  end

  def index
    @students = Student.paginate page: params[:page]
  end

  def destroy
    Student.find(params[:id]).destroy
    flash[:success] = 'Student deleted.'
    redirect_to students_url
  end

  private
    def correct_student_or_admin
      @student = Student.find(params[:id])
      redirect_to root_path unless admin? || current_student?(@student)
    end

    def admin_student
      redirect_to root_path unless current_student && current_student.admin?
    end

    def not_same_student
      redirect_to root_path unless !current_student? Student.find(params[:id])
    end
end

