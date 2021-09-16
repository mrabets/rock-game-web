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

    html = render(
      partial: 'moves/move',
      locals: { move: @move }
    )

    ActionCable.server.broadcast "room_channel_#{@move.room_id}", { html: html }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_move
      @move = Move.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def move_params
      params.require(:move).permit(:content, :user_id, :room_id)
    end
end
