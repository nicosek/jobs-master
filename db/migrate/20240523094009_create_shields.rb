class CreateShields < ActiveRecord::Migration[7.0]
  def change
    create_table :shields do |t|
      t.string :name
      t.integer :defense_points

      t.timestamps
    end
  end
end
