class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @answer.user_id = current_user.id
    @answer.save!
    AnswerMailer.creation_answer_email(@answer).deliver_now
    redirect_to questions_path, notice: "回答しました"
  end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
end
