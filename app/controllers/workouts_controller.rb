require 'pry'

class WorkoutsController < ApplicationController
  before_action :set_user


    def show
      @user = current_user
      @workout = Workout.find(params[:id])


      @exercises = @workout.exercises
      @exercise = @workout.exercises.build

      respond_to do |format|
        format.html {render :show}
        format.json {render json: @workout}
      end

    end

    def index
      @workouts = @user.workouts

      #  respond_to do |format|
      #    format.html {render 'workouts/index', :layout => false}
      #    format.json {render json: @workouts}
      #  end

      render :json => @workouts
      #render 'workouts/index', :layout => false
    end

    def current_workouts
      @user = current_user
      @workouts = @user.workouts
       respond_to do |format|
         format.html {render 'workouts/index', :layout => false}
         format.json {render json: @workouts}
       end
    end

    def new
      @user = current_user
      @workout = Workout.new(user_id: params[:user_id])
    end

    def create
        if logged_in?
          @user = current_user
          @workout = @user.workouts.build(workout_params)
            if @workout.save
            session[:workout_id] = @workout.id
              # render "workouts/show", :layout => false
              render "create.js", :layout => false
            else
              redirect_to @user
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
        :day,
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
