class AddUserIdToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :user_id, :integer
    add_index :species, :user_id
  end
end
