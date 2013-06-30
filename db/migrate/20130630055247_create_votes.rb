class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :cand_id

      t.timestamps
    end

    add_index :votes, :voter_id
    add_index :votes, :cand_id
    add_index :votes, [:voter_id, :cand_id], unique: true
  end
end
