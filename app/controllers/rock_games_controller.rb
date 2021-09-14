class RockGamesController < ApplicationController
  def new
    @rock_game = RockGame.new
    @types = ['rock paper scissors', 'rock spock paper lizard scissors']
  end

  def create
    @rock_game = RockGame.new rock_game_params

    if @rock_game.save
      flash[:success] = 'Your game has added'
      redirect_to @rock_game
    else
      render 'new'
    end
  end

  def show
    @rock_game = RockGame.find params[:id]
    @moves = @rock_game.moves.split
  end

  def index
    @rock_games = RockGame.all
  end


  private

  def rock_game_params
    params.require(:rock_game).permit(:set_of_moves, :moves)
  end
end
