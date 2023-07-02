class CreateCircuits < ActiveRecord::Migration[7.0]
  def change
    create_table :circuits do |t|
      t.string :name
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
