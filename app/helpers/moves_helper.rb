module MovesHelper
  def process_moves(room_id, move)
    row_moves = Move.where(room_id: room_id).limit(2)

      if (row_moves.map(&:content).size == 2)
        players_id = row_moves.map(&:user_id)

        moves = row_moves.map(&:content)

        first_player_name, second_player_name = User.find(players_id[0]).name, User.find(players_id[1]).name   
        
        result_message = get_message_result(
          moves[0],
          moves[1],
          first_player_name,
          second_player_name,
          room_id)       
        
        SendMoveJob.perform_later(move, result_message)
        Move.destroy_by(room_id: room_id)
      else
        SendMoveJob.perform_later(move)
      end
  end

  private

  def get_message_result(first_move, second_move, first_player_name, second_player_name, room_id)
      number_result = ->a,b{(2+a.sum%88%6-b.sum%88%6)%5%3}
      number = number_result.call(first_move.to_s, second_move.to_s)

      first_index = Room.find(room_id).name.split.find_index(first_move)
      second_index = Room.find(room_id).name.split.find_index(second_move)

      n = Room.find(room_id).name.split.size
      number = (n + first_index - second_index) % n

      if number == 0
        return "Draw"
      elsif number % 2 == 0
        return "#{second_player_name} win"
      elsif number % 2 == 1
        return "#{first_player_name} win"
      end
    end

    def get_two_players_ids
      Move.where(room_id: move_params[:room_id]).limit(2).map(&:user_id)
    end

    def get_message(number)
      if number == 0
        return "DRAW"
      elsif number % 2 == 1
        return "LOSE"
      elsif number % 2 == 0
        return "WIN"
      end
    end
end
