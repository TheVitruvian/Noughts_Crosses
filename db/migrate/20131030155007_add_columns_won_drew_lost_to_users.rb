class AddColumnsWonDrewLostToUsers < ActiveRecord::Migration
  def change
    add_column :users, :won, :integer
    add_column :users, :drew, :integer
    add_column :users, :lost, :integer
  end
end
