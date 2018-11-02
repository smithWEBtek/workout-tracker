class WorkoutsController < ApplicationController

  before_action :set_workout, only: [:show]

  def index
    @workouts = Workout.all
    #render json: @workouts
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end



  private

    def workout_params
      params.require(:name).permit(:description, :day)
    end

    def set_workout
      @workout = Workout.find(params[:id])
    end

end
