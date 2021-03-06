module SessionsHelper

  def sign_in(student)
    cookies[:remember_token] = { value: student.remember_token, 
                                 expires: 1.hour.from_now.utc}
    self.current_student = student
  end

  def signed_in?
    !current_student.nil?
  end

  def admin?
    signed_in? && @current_student.admin?
  end

  def current_student=(student)
    @current_student = student
  end

  def current_student
    @current_student ||= Student.find_by_remember_token(cookies[:remember_token])
  end

  def current_student?(student)
    student == current_student
  end

  def signed_in_student
    unless signed_in?
      store_location
      redirect_to signin_url, notice: 'Please sign in.'
    end
  end 

  def sign_out
    self.current_student = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
