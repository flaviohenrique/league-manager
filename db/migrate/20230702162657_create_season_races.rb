class CreateSeasonRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :season_races do |t|
      t.string :name
      t.references :circuit, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true
      t.string :race_type
      t.numeric :order

      t.timestamps
    end
  end
end
