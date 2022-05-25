class AnswersController < ApplicationController
    before_action :logged_in_user
    
    def create
        if @question = Question.find(params[:question_id])
            @question.answers.create(answer_params)
            redirect_to question_path(@question)
        else
            render "questions/show"
        end
    end

    private
    def answer_params
        params.require(:answer).permit(:user_id, :question_id, :body)
    end
end
