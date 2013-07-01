class AddCandidateToStudents < ActiveRecord::Migration
  def change
    add_column :students, :candidate, :boolean, default: false

  end
end
