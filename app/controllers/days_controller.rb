class DaysController < ApplicationController



  def index
    @days = Day.all
    #render json: @days
  end

  def show
    @day = Day.find(params[:id])
  end

  def new
    @day = Day.create(day_params)
  end



  private

    def day_params
      params.require(:name)
    end

end
