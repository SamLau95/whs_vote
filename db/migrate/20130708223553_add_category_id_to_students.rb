class AddCategoryIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :category_id, :integer
  end
end
