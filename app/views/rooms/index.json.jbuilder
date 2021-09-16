json.set! :data do
  json.array! @rooms do |room|
    json.partial! 'rooms/room', room: room
    json.url  "
              #{link_to 'Show', room }
              #{link_to 'Edit', edit_room_path(room)}
              #{link_to 'Destroy', room, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end