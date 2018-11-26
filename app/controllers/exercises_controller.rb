require 'pry'

class ExercisesController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :set_workout


   def index
     @exercise = @workout.exercises.new

      @exercises = @workout.exercises
      respond_to do |format|
        format.html
        format.json {render json: @exercises}
      end

      #render 'exercises/index', :layout => false
    end


  def show
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render json: @exercise}
    end
    #render json: Exercise.find(params[:id])
  end

  def new
    @user = current_user
    @workout = @user.workouts.find(params[:workout_id])
    @exercise = Exercise.new(workout_id: params[:workout_id], user_id: params[:user_id])
  end

	def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
      if @exercise.save
        render "exercises/show", :layout => false
      else
        redirect_to @workout
      end
  end


  def edit

  end


  def update
    exercise = Exercise.find(params[:id])
    exercise.update_attributes(exercise_params)
    render json: exercise
  end

  def destroy
    #@exercise.delete
    Exercise.destroy(params[:id])
  end



private
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

    def exercise_params
      params.require(:exercise).permit(:name,
      :equipment,
      :description,
      :muscles,
      :sets,
      :reps,
			:rest,
			:workout_id)
    end

end
