class AnswerMailer < ApplicationMailer
  def creation_answer_email(answer)
    @answer = answer
    users = User.where.not(id: @answer.user_id).pluck(:email)
    mail(
      to: users,
      subject: '回答完了メール',
      from: 'tomoya.admin@example.com'
    )
  end
end
