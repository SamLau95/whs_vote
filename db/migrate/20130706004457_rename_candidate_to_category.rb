class RenameCandidateToCategory < ActiveRecord::Migration
  def up
    remove_column :students, :candidate
    add_column :students, :category, :integer
  end

  def down
    remove_column :students, :category
    add_column :students, :candidate, :integer
  end
end
