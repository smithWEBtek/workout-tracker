class DaysController < ApplicationController
  before_action :set_user


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
      params.require(:day).permit(:name, :user_id)
    end

    def set_user
      @user = current_user
    end

end
