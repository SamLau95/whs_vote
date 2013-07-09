class AddTypeToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :type, :string
    add_column :categories, :grade, :integer
  end
end
