class QuestionsController < ApplicationController
  def index
    solv = params[:resolved] 
    if solv == '1'
      @q = Question.where(resolved: true).ransack(params[:q])
      @questions = @q.result(distinct: true).page(params[:page])
    elsif solv == '0'
      @q = Question.where(resolved: false).ransack(params[:q])
      @questions = @q.result(distinct: true).page(params[:page])
     else
      @q = Question.all.ransack(params[:q])
      @questions = @q.result(distinct: true).page(params[:page])
    end
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = current_user.questions.new(question_params)

    if params[:back].present?
      render :new
      return
    end

    @question.save!
    QuestionMailer.creation_email(@question).deliver_now
    redirect_to questions_path, notice: "質問「#{@question.title}」を投稿しました。"
  end
  
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(question_id: params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update!(question_params)
    redirect_to questions_path
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path, notice: "質問を削除しました。"  
  end
  
  private 


  def question_params
    params.require(:question).permit(:title, :content, :resolved)
  end

end
