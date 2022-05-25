class UsersController < ApplicationController
  before_action :logged_in_user, only:[:index, :show]

  def home
  end

  def new
      @user = User.new
  end

  def index
      @questions = current_user.questions.all.order(created_at: :desc).page(params[:page])
  end

  def show
      @user = User.find(params[:id])
      @question = @user.questions

      favorites = Favorite.where(user_id: current_user.id).pluck(:question_id)
      @favorite_list = Question.find(favorites)
  end
   
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to new_session_path
      else
        render 'new'
      end
    end
   
    private
    
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
