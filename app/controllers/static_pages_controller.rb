class StaticPagesController < ApplicationController
  def home
    @student = current_student if signed_in?
  end

  def about
  end

  def contact
  end
end
