class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by_s_id params[:s_id]
    if student && dates_match(student.birthdate, params[:birthdate])
      sign_in student
      redirect_back_or student
    else
      flash.now[:error] = 'Wrong ID/birthdate combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
    def dates_match(d1, d2)
      begin
        Date.strptime(d1, '%m/%d/%Y') == Date.strptime(d2, '%m/%d/%Y')
      rescue
        false
      end
    end
end
