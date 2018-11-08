require 'pry'

class WorkoutsController < ApplicationController
  before_action :set_user

    def show
      @workout = Workout.find(params[:id])
    end

    def index
      @workouts = Workout.all
    end

    def new
      @workout = Workout.new(user_id: params[:user_id])
    end

    def create

        if logged_in?
          @user = current_user
          @workout = @user.workouts.build(workout_params)
            if @workout.save
            session[:workout_id] =@workout.id
              render 'workouts/show', :layout => false
            else
              render 'users/show'
            end
        else
           redirect_to root_url
       end

    end


    def edit

    end

    def update
      if @workout.update(workout_params)
         redirect_to @workout
       else
         render :edit
       end
    end

    def destroy
      @workout.delete
    end



private
      def workout_params
        params.require(:workout).permit(
        :name,
        :description,
        :user_id
        )
      end

      def set_workout
        @workout = Workout.find(params[:id])
      end

      def set_user
        @user = current_user
      end
end
