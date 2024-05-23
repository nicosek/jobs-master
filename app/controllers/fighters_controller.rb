class FightersController < ApplicationController
  def index
    @fighters = Fighter.all.order(Arel.sql('(attack_points + health_points) DESC'))
  end

  def show
    fighter
    @home_fights = fighter.home_fights
                          .order(fight_time: :desc)
                          .includes(:fight_steps)

    @away_fights = fighter.away_fights
                          .order(fight_time: :desc)
                          .includes(:fight_steps)
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @new_fighter = Fighter.new(fighter_params)
    if @new_fighter.save
      redirect_to fighter_path(id: @new_fighter.id)
    else
      flash.alert = @new_fighter.errors.messages
      redirect_to new_fighter_path
    end
  end

  private

  def fighter
    @fighter ||= Fighter.find(params[:id])
  end

  def fighter_params
    params.require(:fighter).permit(:name, :health_points, :attack_points, :maximum_total_points)
  end
end
