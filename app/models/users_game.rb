class UsersGame < ActiveRecord::Base
  attr_accessible :is_player_1

  belongs_to :user
  belongs_to :game
end