class MoveToPlayerNumInUserGames < ActiveRecord::Migration
  def up
    remove_column :games, :player_1
    remove_column :games, :player_2
    remove_column :games, :p1_go
    add_column :users_games, :is_player_1, :boolean
  end

  def down
    add_column :games, :player_1, :string
    add_column :games, :player_2, :string
    add_column :games, :p1_go, :boolean
    remove_column :users_games, :is_player_1, :boolean
  end
end
