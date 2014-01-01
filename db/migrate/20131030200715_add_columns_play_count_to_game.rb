class AddColumnsPlayCountToGame < ActiveRecord::Migration
  def change
    add_column :games, :player_one_go, :boolean
    add_column :games, :play_count, :integer
  end
end
