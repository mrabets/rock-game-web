class SendMoveJob < ApplicationJob
  queue_as :default

  def perform(move, result='')
    mine = ApplicationController.render(
      partial: 'moves/mine',
      locals: { move: move, result: result }
    )

    theirs = ApplicationController.render(
      partial: 'moves/theirs',
      locals: { move: move, result: result }
    )

    ActionCable.server.broadcast "room_channel_#{move.room_id}", { mine: mine, theirs: theirs, move: move }
  end
end
