class MovesController < ApplicationController
  before_action :set_move, only: %i[ show edit update destroy ]

  # GET /moves or /moves.json
  def index
    @moves = Move.all
  end

  # GET /moves/1 or /moves/1.json
  def show
  end

  # GET /moves/new
  def new
    @move = Move.new
  end

  # GET /moves/1/edit
  def edit
  end

  # POST /moves or /moves.json
  def create
    @move = Move.new(move_params)
    # @move.user = current_user
    @move.save

    # Send result
    if (Move.where(room_id: move_params[:room_id]).limit(2).map(&:content).size == 2)
      moves = Move.where(room_id: move_params[:room_id]).limit(2).map(&:content)
      SendMoveJob.perform_later(@move, get_message_result(moves[0], moves[1]))
    else
      SendMoveJob.perform_later(@move)
    end
  end

  # PATCH/PUT /moves/1 or /moves/1.json
  def update
    respond_to do |format|
      if @move.update(move_params)
        format.html { redirect_to @move, notice: "Move was successfully updated." }
        format.json { render :show, status: :ok, location: @move }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1 or /moves/1.json
  def destroy
    @move.destroy
    respond_to do |format|
      format.html { redirect_to moves_url, notice: "Move was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def get_message_result(first_move, second_move)
      number_result = ->a,b{(2+a.sum%88%6-b.sum%88%6)%5%3}
      number = number_result.call(first_move.to_s, second_move.to_s)

      case number
      when 0
        return "Player one win"
      when 1
        return "Player two win"
      end

      "Draw"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_move
      @move = Move.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def move_params
      params.require(:move).permit(:content, :user_id, :room_id)
    end
end
