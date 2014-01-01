class ChangeColumnNameFromFirstNameToName < ActiveRecord::Migration
  def up
    rename_column :users, :first_name, :name
    remove_column :users, :last_name
  end

  def down
  end
end
