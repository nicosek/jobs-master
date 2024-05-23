class FightsController < ApplicationController
  def show
    @steps = fight.fight_steps
                  .order(:created_at)
                  .includes(:attacker, :defender)
  end

  def new
    @fight = Fight.new
    @fighters = Fighter.all.order(Arel.sql('(attack_points + health_points) DESC'))
  end

  def create
    @new_fight = Fight.new(new_fight_params)
    if @new_fight.save
      redirect_to fight_path(id: @new_fight.id)
    else
      flash.alert = @new_fight.errors.messages
      redirect_to new_fight_path
    end
  end

  def start
    fight.start!
    redirect_to fight_path(id: fight.id)
  end

  private

  def fight
    @fight ||= Fight.find(params[:id])
  end

  def new_fight_params
    {
      home_fighter: new_fight_home_fighter,
      away_fighter: new_fight_away_fighter,
      home_weapon: new_fight_home_weapon,
      home_shield: new_fight_home_shield,
      away_weapon: new_fight_away_weapon,
      away_shield: new_fight_away_shield
    }
  end

  def new_fight_home_fighter
    new_fight_home_fighter ||= Fighter.find_by name: fight_params['home_fighter']
  end

  def new_fight_away_fighter
    new_fight_away_fighter ||= Fighter.find_by name: fight_params['away_fighter']
  end

  def new_fight_home_weapon
    new_fight_home_weapon ||= Weapon.find_by name: fight_params['home_weapon']
  end

  def new_fight_home_shield
    new_fight_home_shield ||= Shield.find_by name: fight_params['home_shield']
  end

  def new_fight_away_weapon
    new_fight_away_weapon ||= Weapon.find_by name: fight_params['away_weapon']
  end

  def new_fight_away_shield
    new_fight_away_shield ||= Shield.find_by name: fight_params['away_shield']
  end

  def fight_params
    params.require(:fight).permit(:home_fighter, :away_fighter, :home_weapon, :home_shield, :away_weapon, :away_shield)
  end
end
