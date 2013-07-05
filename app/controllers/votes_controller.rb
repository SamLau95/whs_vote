class VotesController < ApplicationController
  before_filter :signed_in_student

  def create
    # redirect_to student_path current_student
  end
end
