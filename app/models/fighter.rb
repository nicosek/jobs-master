class Fighter < ApplicationRecord
  LOWEST_TOTAL_POINTS = 180
  HIGHEST_TOTAL_POINTS = 220
  LOWEST_HEALTH_POINTS = 1
  HIGHEST_HEALTH_POINTS = 200
  LOWEST_ATTACK_POINTS = 1
  HIGHEST_ATTACK_POINTS = 200

  has_many :home_fights, class_name: 'Fight', foreign_key: 'home_fighter_id'
  has_many :away_fights, class_name: 'Fight', foreign_key: 'away_fighter_id'

  validates_presence_of :name, :health_points, :attack_points, :maximum_total_points
  validates_uniqueness_of :name

  validates_inclusion_of :maximum_total_points, :in => LOWEST_TOTAL_POINTS..HIGHEST_TOTAL_POINTS
  validates_inclusion_of :health_points, :in => LOWEST_HEALTH_POINTS..HIGHEST_HEALTH_POINTS
  validates_inclusion_of :attack_points, :in => LOWEST_ATTACK_POINTS..HIGHEST_ATTACK_POINTS
  validate :health_and_attack_inferior_to_maximum_total_points

  def initialize(*args)
    super(*args)
    set_default_maximum_total_points
  end

  private

  def set_default_maximum_total_points
    self.maximum_total_points ||= rand(LOWEST_TOTAL_POINTS..HIGHEST_TOTAL_POINTS)
  end

  def health_and_attack_inferior_to_maximum_total_points
    return unless maximum_total_points
    return unless health_points
    return unless attack_points

    error_message = "La somme des points de vie et des points d'attaque ne peut excéder #{maximum_total_points}"
    errors.add(:base, error_message) unless maximum_total_points >= health_points + attack_points
  end
end
