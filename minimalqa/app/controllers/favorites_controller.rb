class FavoritesController < ApplicationController
    before_action :set_favorite
    before_action :logged_in_user

    def create
        if @question.user_id != current_user.id
          @favorite = Favorite.create(user_id: current_user.id, question_id: @question.id)
        end
    end

    def destroy
        @favorite = Favorite.find_by(user_id: current_user.id, question_id: @question.id)
        @favorite.destroy
    end
    
    private
    def set_favorite
        @question = Question.find(params[:question_id])
    end
end
