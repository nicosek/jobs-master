class CreateFightSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :fight_steps do |t|
      t.references :fight, null: false, foreign_key: true
      t.references :attacker, null: false
      t.references :defender, null: false
      t.integer :damage_points

      t.timestamps
    end

    add_foreign_key :fight_steps, :fighters, column: :attacker_id
    add_foreign_key :fight_steps, :fighters, column: :defender_id
  end
end
