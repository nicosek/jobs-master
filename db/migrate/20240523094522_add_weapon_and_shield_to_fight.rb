class AddWeaponAndShieldToFight < ActiveRecord::Migration[7.0]
  def change
    add_reference :fights, :home_weapon
    add_reference :fights, :home_shield
    add_reference :fights, :away_weapon
    add_reference :fights, :away_shield

    add_foreign_key :fights, :weapons, column: :home_weapon_id
    add_foreign_key :fights, :shields, column: :home_shield_id
    add_foreign_key :fights, :weapons, column: :away_weapon_id
    add_foreign_key :fights, :shields, column: :away_shield_id
  end
end
