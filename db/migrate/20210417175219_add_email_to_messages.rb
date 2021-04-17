class AddEmailToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :email, :string
  end
end
