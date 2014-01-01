class CreateUsersAndGames < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.text :avatar
      t.timestamps
    end

    create_table :games do |t|
      t.string :game_id
      t.string :game_board
      t.string :player_1
      t.string :player_2
      t.boolean :p1_go
      t.timestamps
    end

    create_table :users_games do |t|
      t.belongs_to :game
      t.belongs_to :user
      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :games
    drop_table :users_game
  end
end
