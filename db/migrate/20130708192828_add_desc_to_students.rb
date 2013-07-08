class AddDescToStudents < ActiveRecord::Migration
  def change
    add_column :students, :desc, :text

  end
end
