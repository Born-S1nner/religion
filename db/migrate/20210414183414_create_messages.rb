class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :username
      t.string :religion
      t.string :blog

      t.timestamps
    end
  end
end
