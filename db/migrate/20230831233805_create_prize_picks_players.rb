class CreatePrizePicksPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :prize_picks_players do |t|
      t.string :api_id, null: false
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
  end
end
