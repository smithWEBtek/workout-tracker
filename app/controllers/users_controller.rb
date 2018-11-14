class UsersController < ApplicationController
  before_action :set_user
  helper_method :current_user

  def logged_in?
    !!current_user
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts
    @workout = @user.workouts.build
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user) }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if logged_in?
        @user = User.create(user_params)
        @user.save
        format.html { redirect_to user_path(@user) }
      else
        format.html { render edit_user_path }
      end
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


private
    def set_user
      @user = User.find(params[:id])
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_params
      params.require(:user).permit(:email, :user_name)
    end

end
