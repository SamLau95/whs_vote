class StaticPagesController < ApplicationController
  def home
    redirect_to current_student if signed_in?
  end

  def about
  end

  def contact
  end
end
