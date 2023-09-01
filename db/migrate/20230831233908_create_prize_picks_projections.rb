class CreatePrizePicksProjections < ActiveRecord::Migration[7.0]
  def change
    create_table :prize_picks_projections do |t|
      t.string :api_id, null: false
      t.jsonb :data, null: false, default: {}

      t.references :player, null: false, foreign_key: { to_table: :prize_picks_players }
      t.timestamps
    end
  end
end
