class SendMoveJob < ApplicationJob
  queue_as :default

  def perform(move)
    html = ApplicationController.render(
      partial: 'moves/move',
      locals: { move: move }
    )

    ActionCable.server.broadcast "room_channel_#{move.room_id}", { html: html }
  end
end
