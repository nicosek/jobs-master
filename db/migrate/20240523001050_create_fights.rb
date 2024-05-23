class CreateFights < ActiveRecord::Migration[7.0]
  def change
    create_table :fights do |t|
      t.references :home_fighter, null: false
      t.references :away_fighter, null: false
      t.datetime :fight_time
      t.string :state

      t.timestamps
    end

    add_foreign_key :fights, :fighters, column: :home_fighter_id
    add_foreign_key :fights, :fighters, column: :away_fighter_id
  end
end
