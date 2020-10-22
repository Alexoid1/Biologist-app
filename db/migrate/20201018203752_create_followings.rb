class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :followerid, index: true
      t.integer :followedid, index: true

      t.timestamps
    end
  end
end
