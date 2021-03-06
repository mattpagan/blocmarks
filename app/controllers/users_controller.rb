class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @user_topics = @user.topics
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = @user.likes
  end

  def update
   if current_user.update_attributes(user_params)
      flash[:notice] = "User info updated"
      redirect_to edit_user_registration_path
   else
     flash[:error] = "Invalid user info"
     redirect_to edit_user_registration_path
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end

