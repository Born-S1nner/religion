class CreatePeers < ActiveRecord::Migration[6.1]
  def change
    create_table :peers do |t|
      t.string :username
      t.string :email
      t.string :religion

      t.timestamps
    end
  end
end
