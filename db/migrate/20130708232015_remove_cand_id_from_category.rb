class RemoveCandIdFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :candidate_id
  end
end
