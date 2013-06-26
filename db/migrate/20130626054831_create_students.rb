class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :name
      t.integer :s_id
      t.string  :birthdate

      t.timestamps
    end
  end
end
