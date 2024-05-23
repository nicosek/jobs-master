class Shield < ApplicationRecord
  LOWEST_DEFENSE_POINTS = 1
  HIGHEST_DEFENSE_POINTS = 20

  validates_inclusion_of :defense_points, :in => LOWEST_DEFENSE_POINTS..HIGHEST_DEFENSE_POINTS

  def presentation
    "#{name} (#{defense_points} points de défense)"
  end
end
