class FightSteps::ComputeDamagePoints
  STEP_ATTACK_RATE = 0.2

  def initialize(fight_step:)
    @fight_step = fight_step
    @attacker = fight_step.attacker
    @fight = fight_step.fight
  end

  def call
    [0, total_damage].max
  end

  private

  def total_damage
    attacker_damage + attacker_weapon_damage - defender_shield_protection
  end

  def attacker_damage
    @attacker.attack_points * STEP_ATTACK_RATE * rand(25..100) / 100.0
  end

  def attacker_weapon_damage
    return 0 unless attacker_weapon.present?

    attacker_weapon.attack_points * rand(50..100) / 100.0
  end

  def attacker_weapon
    @attacker_weapon ||= (@attacker == @fight.home_fighter ? @fight.home_weapon : @fight.away_weapon)
  end

  def defender_shield_protection
    return 0 unless defender_shield.present?

    defender_shield.defense_points * rand(50..100) / 100.0
  end

  def defender_shield
    @defender_shield ||= (@attacker == @fight.home_fighter ? @fight.away_shield : @fight.home_shield)
  end
end