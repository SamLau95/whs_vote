class AddIndexToStudentsSId < ActiveRecord::Migration
  def change
    add_index :students, :s_id, unique: true
  end
end
