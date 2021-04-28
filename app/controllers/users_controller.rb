class UsersController < ApplicationController
    def index
        @user = User.find_by(id: session[:userid])
        
    end

    def new 
      @user = User.new
    end

    def create 
      @user = User.new(user_params)
      if @user.save 
        session[:userid] = @user.id 
        redirect_to users_path, notice: "Hey #{@user.name}! Been A While! Looking for anything exciting ???" 
      else
        render :new
      end
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :username, :email, :password, :password_confirmation)
    end

end
