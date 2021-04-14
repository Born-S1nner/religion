class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.interger :user_id
      t.string :username
      t.string :blog

      t.timestamps
    end
  end
end
