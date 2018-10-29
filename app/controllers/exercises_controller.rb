class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show]

  def index
    @exercises = Exercise.all
    #render json: @exercises
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @exercise = Exercise.create(exercise_params)
  end



  private

    def exercise_params
      params.require(:name).permit(:equipment, :description, :muscles)
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end
end
