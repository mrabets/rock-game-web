json.set! :data do
  json.array! @moves do |move|
    json.partial! 'moves/move', move: move
    json.url  "
              #{link_to 'Show', move }
              #{link_to 'Edit', edit_move_path(move)}
              #{link_to 'Destroy', move, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end