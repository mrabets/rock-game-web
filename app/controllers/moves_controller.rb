class MovesController < ApplicationController
  before_action :set_move, only: %i[ show ]

  def index
    @moves = Move.all
  end

  def show
  end

  def new
    @move = Move.new
  end

  def create
    @move = Move.new(move_params)
    
    if @move.save
      helpers.process_moves(move_params[:room_id], @move)
    else
      flash[:danger] = "Please, click the button"
      redirect_to room_path(move_params[:room_id])
    end
  end

  private
    def set_move
      @move = Move.find(params[:id])
    end

    def move_params
      params.require(:move).permit(:content, :user_id, :room_id)
    end
end
