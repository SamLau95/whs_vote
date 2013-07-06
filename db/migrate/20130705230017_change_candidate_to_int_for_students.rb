class ChangeCandidateToIntForStudents < ActiveRecord::Migration
  def up
    remove_column :students, :candidate
    add_column :students, :candidate, :integer
  end

  def down
    remove_column :students, :candidate
    add_column :students, :candidate, :boolean, default: false
  end
end
