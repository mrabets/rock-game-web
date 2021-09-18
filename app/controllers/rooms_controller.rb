class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[ show ]

  def index
    @rooms = Room.all
  end

  def show
    @moves = Room.find(params[:id]).name.split
    @button_colors = get_button_color(@moves)
  end

  def new
    @room = Room.new
    @types = ['rock paper scissors', 'rock spock paper lizard scissors']
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room
    else
      @types = ['rock paper scissors', 'rock spock paper lizard scissors']
      render 'new'
    end
  end

  private
    def get_button_color(moves)
      button_colors = ['success', 'danger', 'warning', 'info', 'light']

      while(button_colors.size < moves.size)
        button_colors += button_colors
      end

      button_colors
    end

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name)
    end
end
