class Fight < ApplicationRecord
  include AASM

  belongs_to :home_fighter, class_name: 'Fighter'
  belongs_to :away_fighter, class_name: 'Fighter'
  belongs_to :home_weapon, class_name: 'Weapon', optional: true
  belongs_to :home_shield, class_name: 'Shield', optional: true
  belongs_to :away_weapon, class_name: 'Weapon', optional: true
  belongs_to :away_shield, class_name: 'Shield', optional: true

  has_many :fight_steps, dependent: :destroy

  validate :home_and_away_fighters_are_different

  aasm.attribute_name :state

  aasm do
    state :not_started, initial: true
    state :pending, :finished

    event :start, after_commit: :lets_get_ready_to_rumble do
      transitions from: [:not_started, :pending], to: :pending
    end

    event :finish do
      transitions from: :pending, to: :finished
    end
  end

  def winner
    @winner ||= fight_steps.last&.attacker
  end

  def loser
    @loser ||= fight_steps.last&.defender
  end

  private

  def home_and_away_fighters_are_different
    errors.add(:base, 'Les Combattants doivent être différents') if home_fighter == away_fighter
  end

  def lets_get_ready_to_rumble
    ::Fights::Launch.new(fight: self).call
  end
end
