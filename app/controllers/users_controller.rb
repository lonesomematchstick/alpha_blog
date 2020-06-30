class UsersController < ApplicationController
 
  before_action :fetch_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    @users = User.page(params[:page])
  end

  def show
    @user_articles = @user.articles
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.username}! Your account was successfully created!"
      redirect_to @user
    else
      flash[:alert] = "Uh oh! The user was not created!"
      render 'new'
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      flash[:notice] = "Your account details were successfully updated!"
      redirect_to @user
    else
      flash[:alert] = "Uh oh! The user was not updated!"
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil unless current_user.admin?
    flash[:alert] = "Account and all associated articles have been deleted."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password
    )
  end

  def fetch_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "You cannot perform this action on another user."
      redirect_to user_path(current_user)
    end
  end
end