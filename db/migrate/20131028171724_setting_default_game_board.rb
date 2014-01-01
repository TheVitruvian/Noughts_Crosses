class SettingDefaultGameBoard < ActiveRecord::Migration
  def up
    change_column :games, :game_board, :string,  :default => "yyyyyyyyy"
  end

  def down
  end
end
