class UsersController < ApplicationController

 def show
  @user = User.find(params[:id])
 end

 def edit
  @user = User.find(params[:id])
 end

 def update
  @user = User.find(params[:id])
  @user.avatar = params[:user][:avatar]
  if @user.save
    redirect_to user_path(@user)
  else
    render :edit
  end

 end

end
