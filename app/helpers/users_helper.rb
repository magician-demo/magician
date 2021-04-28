module UsersHelper
    def user_signed_in?
      if session[:userid]
        return true
      else
        return false
      end
    end

    def current_user
      User.find_by(id: session[:userid])
    end
end
