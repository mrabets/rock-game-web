class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @rooms = Room.all.select {|room| Move.where(room_id: room.id).size == 1}
    @moves = @rooms.map{|room| Move.find_by(room_id: room.id).content}
    @data = []
    @moves.each.with_index do |move, index|
      @data << {x: move, value: index}
    end
    @data = @data.to_json.html_safe
  end
end
