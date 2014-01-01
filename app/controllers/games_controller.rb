class GamesController < ApplicationController
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.new

    @game.player_one_go = false
    @game.play_count = 0

    p1 = current_user
    p2 = User.find_by_email params[:player_2]

    ug1 = @game.users_games.build
    ug1.user = p1
    ug1.is_player_1 = true

    ug2 = @game.users_games.build
    ug2.user = p2
    ug2.is_player_1 = false

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game. Is. On!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @game = Game.find params[:id]
    @winner = @game.winner
    @array_board = @game.array_board
  end

  def make_move
    @game = Game.find params[:id]
    row = params[:row].to_i
    col = params[:col].to_i
    @winner, @array_board = @game.make_move row, col, current_user
    @game.save
    @game.player_1.save
    @game.player_2.save
    redirect_to @game
  end

end