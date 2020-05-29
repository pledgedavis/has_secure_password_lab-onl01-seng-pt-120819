class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if params[:user][:password] != params[:user][:password_confirmation]
         redirect_to '/users/new'
    end
    
    session[:user_id] = @user.id
end

private

 def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
 end
end
