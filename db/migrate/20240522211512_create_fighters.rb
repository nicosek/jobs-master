class CreateFighters < ActiveRecord::Migration[7.0]
  def change
    create_table :fighters do |t|
      t.string :name
      t.integer :health_points
      t.integer :attack_points
      t.integer :maximum_total_points

      t.timestamps
    end
  end
end
