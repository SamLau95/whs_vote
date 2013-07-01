class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :student_id
      t.text :desc

      t.timestamps
    end
  end
end
