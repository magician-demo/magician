class UsersController < ApplicationController
    def index
    end

    def new 
      @user = User.new
    end

    def create 
      @user = User.new(user_params)
      if @user.save
        
    end

    private
    def user_params
      params.require(:user).permit(:name. :email, :username, :email, :password, :password_confirmation)
    end

end
