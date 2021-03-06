class MusclesController < ApplicationController
    #before_action :set_muscle

    def index
      @muscles = Muscle.all
      respond_to do |format|
        format.html
        format.json {render json: @muscles}
      end
    end

    def show
      @muscle = Muscle.find(params[:id])
    end

    def new
      @muscle = Muscle.create(muscle_params)
    end



private

      def muscle_params
        params.require(:name)
      end

      def set_muscle
        @muscle = Muscle.find(params[:id])
      end


end
