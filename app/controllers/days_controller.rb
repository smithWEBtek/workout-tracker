class DaysController < ApplicationController

  before_action :set_exercise, only: [:show]

  def index
    @days = Day.all
    #render json: @days
  end

  def show
    @day = Day.find(params[:id])
  end

  def new
    @day = Day.create(exercise_params)
  end



  private

    def exercise_params
      params.require(:name)
    end

    def set_exercise
      @day = Day.find(params[:id])
    end

end
