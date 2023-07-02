class CreateSeasonRaceResults < ActiveRecord::Migration[7.0]
  def change
    create_table :season_race_results do |t|
      t.references :season_race, null: false, foreign_key: true
      t.references :season_driver, null: false, foreign_key: true
      t.boolean :fastest_lap
      t.integer :point
      t.integer :position

      t.timestamps
    end
  end
end
