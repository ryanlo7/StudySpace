class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #debugger
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
        log_in @user
      #flash[:success] = "Welcome to StudySpace!"
        redirect_to @user
    else
        render 'new'
    end
  end

  def edit
    @user= current_user
    @user.courses << params[:course_ids]
    redirect_to @user
  end

  def remove
    @user= current_user
    @user.classes.delete
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :major, :gradyear, :bio, :facebook, :avatar, :course_ids =>[] ) 
  end
end

