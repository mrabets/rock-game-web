class RockGamesController < ApplicationController
  def new
    @rock_game = RockGame.new
    @types = ['rock paper scissors', 'rock spock paper lizard scissors']
  end

  def create
    redirect_to root_path
  end

  def show
  end

  def index
  end
end
