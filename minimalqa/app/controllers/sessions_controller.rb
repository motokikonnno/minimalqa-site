class SessionsController < ApplicationController
    def new
    end
   
    def create
      user = User.find_by(name: params[:session][:name].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to questions_path
      else
        flash[:alert] = "※ ユーザー名またはパスワードが間違っています"
        render 'new'
      end
    end
   
    def destroy
      session.delete(:user_id)
      redirect_to new_session_path
    end
end
