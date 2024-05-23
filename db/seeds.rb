# Create Fighters
Fighter.find_or_create_by(
  name: 'Super Nico',
  maximum_total_points: 220,
  health_points: 100,
  attack_points: 120
)

Fighter.find_or_create_by(
  name: 'Denver le Dernier Dinosaure',
  maximum_total_points: 200,
  health_points: 130,
  attack_points: 70
)

Fighter.find_or_create_by(
  name: 'Spiderman',
  maximum_total_points: 180,
  health_points: 90,
  attack_points: 90
)

# Create Weapons
Weapon.find_or_create_by(name: 'Lance-Pierre', attack_points: 5)
Weapon.find_or_create_by(name: 'Sabre', attack_points: 10)
Weapon.find_or_create_by(name: 'AK47', attack_points: 20)

# Create Shields
Shield.find_or_create_by(name: 'Bouclier Basique', defense_points: 5)
Shield.find_or_create_by(name: 'Bouclier Avancé', defense_points: 10)
Shield.find_or_create_by(name: 'Bouclier Deluxe', defense_points: 20)
