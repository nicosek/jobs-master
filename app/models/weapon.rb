class Weapon < ApplicationRecord
  LOWEST_ATTACK_POINTS = 1
  HIGHEST_ATTACK_POINTS = 20

  validates_inclusion_of :attack_points, :in => LOWEST_ATTACK_POINTS..HIGHEST_ATTACK_POINTS

  def presentation
    "#{name} (#{attack_points} points d'attaque)"
  end
end
