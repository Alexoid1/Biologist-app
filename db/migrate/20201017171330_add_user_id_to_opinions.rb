class AddUserIdToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :authorid, :integer
  end
end
