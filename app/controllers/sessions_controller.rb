class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by_s_id params[:s_id]
    if student && student.birthdate == params[:birthdate]
      sign_in student
      redirect_to student
    else
      flash.now[:error] = 'Invalid ID/birthdate combination'
      render 'new'
    end
  end

  def destroy
  end
end
