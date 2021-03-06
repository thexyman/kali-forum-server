class Api::V1::UsersController < ApplicationController
  
  def index 
    @users = User.all 
    render json: @users
  end 

  def new
    @user = User.new 
  end

  def create
    
    @user = User.new(user_params)
    if @user.save 
      render json: @user
    else
      render json: {error: "user could not be created!"}, status: 400
    end
  end

  def show 
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else 
      render json: {error: "user not found"}, status: 404
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(params)
      render json: @user 
    else 
      render json: {error: "user not found"}, status: 404
    end 
  end

  def edit
    @user = user.find_by(id: params[:id])
    render json: @user
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy 
    render json: @users 
  end

  private 

  def user_params 
    params.require(:user).permit(:name)
  end
  
end
