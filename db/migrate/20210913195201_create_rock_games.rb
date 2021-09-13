class CreateRockGames < ActiveRecord::Migration[6.1]
  def change
    create_table :rock_games do |t|
      t.integer :set_of_moves
      t.text :moves

      t.timestamps
    end
  end
end
