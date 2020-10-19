class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :follower_id, index: true
      t.integer :followed_id, index: true

      t.timestamps
    end
  end
end
