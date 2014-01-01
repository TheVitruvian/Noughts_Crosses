class Game < ActiveRecord::Base
  attr_accessible :game_id, :game_board, :p1_go, :play_count, :player_one_go
  
  before_save :serialise_board

  has_many :users_games
  has_many :users, through: :users_games

  def player_1
    users_games.detect { |r| r.is_player_1 } .user
  end

  def player_2
    users_games.detect { |r| r.is_player_1 == false } .user
  end

  def test_win(row, col, player)
    test = []
 # test row and column
    if array_board[row].all?{|t| t == player} or array_board.transpose[col].all?{|t| t == player} then
      @winner = player
    end
#test diagonal
    if row == col then
      3.times do |t|
        test << array_board[t][t]
      end
      if test.all? {|t| t == player}
        @winner = player
      end
    end
  #test anti-diagonal
    anti_diag_test = []
    anti_diag_test << array_board[0][2] << array_board[1][1] << array_board[2][0]
    if anti_diag_test.all? {|t| t == player} then
        @winner = player
    end
    self.winner = @winner
    return @winner
  end

  def array_board
    @array_board ||= deserialise_board
  end

  def deserialise_board
    game_board.chars.each_slice(3).map { |row| row.map(&:to_sym) }
  end

  def serialise_board
    return unless array_board
    self.game_board = array_board.flatten.map(&:to_s).join
  end

  def make_move(row, col, user)
    #put game logic here

    self.play_count = play_count + 1

    unless users.all.last.is_computer?
      then
        if player_one_go == true
          counter = :x
        else
          counter = :o
        end
      else
        counter = :x
    end

 # "AI" comes in if playing CPU
    if users.all.last.is_computer? && @winner != "X"
      array_board[row][col] = counter 
      test_win(row, col, counter)
      begin
        row = rand(3)
        col = rand(3)
      end until array_board[row][col] == :y  
      array_board[row][col] = :o
      test_win(row, col, :o)
    else
      array_board[row][col] = counter 
      test_win(row, col, counter)
    end    

    # save scores etc

    case @winner
      when :x
        player_1.won += 1
        player_2.lost += 1
      when :o
        player_1.lost += 1
        player_2.won += 1
    end
      
    if play_count == 10
      player_1.drew += 1
      player_2.drew += 1
    end

    self.player_one_go = !player_one_go

    return @winner, array_board

  end

end