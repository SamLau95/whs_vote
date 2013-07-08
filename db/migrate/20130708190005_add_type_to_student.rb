class AddTypeToStudent < ActiveRecord::Migration
  def change
    add_column :students, :type, :string
    remove_column :students, :category
  end
end
