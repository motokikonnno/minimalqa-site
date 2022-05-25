class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :set_search

    def set_search
        @q = Question.ransack(params[:q])
        @questions = @q.result.page(params[:page]).order(created_at: "DESC")
    end

    private
    def logged_in_user
      unless logged_in?
        redirect_to new_session_path
      end
    end
end
