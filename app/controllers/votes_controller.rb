class VotesController < ApplicationController
  before_filter :signed_in_student

  def create
    @student = Student.find_by_id params[:student_id]
    voted = false
    Category.all.each do |category|
      if params[category.name]
        @student.votes.create! params[category.name].to_i
        voted = true
      end
    end
    flash[:error] = "You didn't select any candidates" unless voted
    redirect_to @student
  end
end
