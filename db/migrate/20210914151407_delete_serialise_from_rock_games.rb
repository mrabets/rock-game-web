class DeleteSerialiseFromRockGames < ActiveRecord::Migration[6.1]
  def change
    change_column :rock_games, :moves, :string
  end
end
