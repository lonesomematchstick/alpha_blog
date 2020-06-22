class UsersController < ApplicationController

  before_action :fetch_user, only: [:show, :edit, :update, :destroy]

  # def index
  #   @articles = Article.all
  # end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "The user was successfully created!"
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
      flash[:notice] = "The user was successfully updated!"
      redirect_to @user
    else
      flash[:alert] = "Uh oh! The user was not updated!"
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:alert] = "The user was destroyed."
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

end