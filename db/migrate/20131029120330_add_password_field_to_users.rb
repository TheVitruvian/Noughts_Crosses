class AddPasswordFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :role, :string
    add_column :users, :email, :string
  end
end
