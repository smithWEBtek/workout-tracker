require 'pry'

class WorkoutsController < ApplicationController
  before_action :set_user

    def exercises_data
      respond_to do |format|
        @workout = Workout.find(params[:id])
        @exercises = @workout.exercises
        render json: @exercises

      end
    end

    def show
      @user = current_user


      @workout = @user.workouts.find(params[:id])
       #binding.pry

      respond_to do |format|
        format.html {render :show}
        format.json {render json: @workout, status: 200}
      end

      @exercises = @workout.exercises
      @exercise = @workout.exercises.build
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
            session[:workout_id] =@workout.id
            respond_to do |format|
              format.json {render json: @workout}
              format.html {redirect_to workout_path(@workout)}

            end
              #render "workouts/show", :layout => false
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
