class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :follower, index: true, foreign_key: {to_table: :users}
      t.references :followed, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
