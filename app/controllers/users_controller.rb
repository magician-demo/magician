class UsersController < ApplicationController
    def index
        @user = User.find_by(id: session[:userid])
        @events = @user.events
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

    def show
    end

    def sign_in
        @user = User.new
    end

    def sign_in_verify
      user = User.login(user_params)
      if user
        session[:userid] = user.id
        redirect_to users_path, notice: "Hey #{user.name}! Been A While! Looking for anything exciting ???" 
      else
        redirect_to sign_in_users_path, notice: "Incorrect Username or Password"
      end
    end


    def destroy
      session[:userid] = nil
      redirect_to events_path
    end


    private
    def user_params
      params.require(:user).permit(:name, :email, :username, :email, :password, :password_confirmation)
    end

end
