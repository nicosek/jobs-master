class Fights::Launch
  INTERRUPTION_STEP_THRESHOLD = 40

  def initialize(fight:)
    @fight = fight
  end

  def call
    step = 1
    while @fight.state == 'pending' && step <= INTERRUPTION_STEP_THRESHOLD do
      @fight.fight_steps.create!
      step += 1
    end
  end
end