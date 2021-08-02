class Admin::QuestionsController < ApplicationController
  before_action :require_admin

  def index
    solv = params[:resolved] 
    if solv == '1'
      @questions = Question.where(resolved: true)
    elsif solv == '0'
      @questions = Question.where(resolved: false)
    else
      @questions = Question.all
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to admin_questions_path, notice: "質問を削除しました。"  
  end

  private 
  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
