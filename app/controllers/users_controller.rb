class UsersController < ApplicationController

  
  def new
    @user = User.new
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
     redirect_to root_path
    else
      render :new
   end
  
   private

   def user_params
     params.require(:user).permit(:first_name,:first_name,:first_furigana,:family_furigana,:email,:nickname,:birth,:password )
   end


end
