class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :candidate_id

      t.timestamps
    end
    add_index :categories, :candidate_id
  end
end
