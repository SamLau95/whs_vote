class VotesController < ApplicationController
  before_filter :signed_in_student

  def create
    @student = Student.find_by_id params[:student_id]

    Category.all.each do |category|
      @student.votes.create! cand_id: params[category.name].to_i if params[category.name]
    end

    if @student.votes.any?
      flash[:success] = "Thanks for voting!"
    else
      flash[:error] = "You didn't select any candidates"
    end
    redirect_to @student
  end
end
