class FightStep < ApplicationRecord
  belongs_to :fight
  belongs_to :attacker, class_name: 'Fighter'
  belongs_to :defender, class_name: 'Fighter'

  validates_presence_of :damage_points
  validate :fight_is_pending

  before_validation :set_attacker_and_defender, :set_damage_points
  after_save :finish_the_fight, :date_the_fight, if: :final_step?

  private

  def fight_is_pending
    errors.add(:fight, "Le combat n'est pas en cours de déroulement" ) unless fight.pending?
  end
  
  def set_attacker_and_defender
    if last_fight_step.present?
      self.attacker ||= last_fight_step.defender
      self.defender ||= last_fight_step.attacker
    else
      self.attacker ||= fight.home_fighter
      self.defender ||= fight.away_fighter
    end
  end
  
  def last_fight_step
    fight.fight_steps.last
  end

  def set_damage_points
    self.damage_points ||= FightSteps::ComputeDamagePoints.new(fight_step: self).call
  end

  def finish_the_fight
    fight.finish!
  end

  def final_step?
    fight.fight_steps.where(defender: defender).sum(:damage_points) >= defender.health_points
  end

  def date_the_fight
    fight.update fight_time: Time.now
  end
end
