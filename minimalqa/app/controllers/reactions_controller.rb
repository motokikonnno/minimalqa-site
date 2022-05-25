class ReactionsController < ApplicationController
  before_action :logged_in_user

  def new
    answer = Answer.find(params[:answer_id])
    @reaction = answer.reactions.build(user_id: current_user.id)
  end

  def create
    answer = Answer.find(params[:answer_id])
    @reaction = answer.reactions.build(reaction_params)

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to question_path(answer.question_id), notice: "Reaction was successfully created." }
        format.json { render :show, status: :created, location: @reaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def reaction_params
      params.require(:reaction).permit(:user_id, :answer_id, :body)
    end
end
