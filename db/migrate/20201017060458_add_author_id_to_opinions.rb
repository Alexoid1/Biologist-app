class AddAuthorIdToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_column :opinions, :author_id, :integer
  end
end
