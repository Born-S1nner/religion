class AddUserIdToPeers < ActiveRecord::Migration[6.1]
  def change
    add_column :peers, :user_id, :interger
    add_index :peers, :user_id
  end
end
