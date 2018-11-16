require 'pry'

class ExercisesController < ApplicationController
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
      format.json {render json: @exercise, status: 200}
    end
    #render json: Exercise.find(params[:id])
  end

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.new(workout_id: params[:workout_id], user_id: params[:user_id])


  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.build(exercise_params)
      if @exercise.save
        redirect_to @workout
      else
        redirect_to workouts_path(@workout)
      end
  end

  # def create
  #   respond_to do |format|
  #     if current_workout.id == @workout.id
  #       @exercise = current_workout.exercises.build(exercise_params)
  #       binding.pry
  #       @exercise.save
  #
  #       session[:exercise_id] = @exercise.id
  #       format.html { redirect_to current_workout }
  #     else
  #       format.html{ redirect_to workouts_path }
  #     end
  #   end
  # end

  # def create
  #   exercise = Exercise.create(exercise_params)
  #   render json: exercise
  # end


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
      :rest)
    end

end
