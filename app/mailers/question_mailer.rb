class QuestionMailer < ApplicationMailer
  def creation_email(question)
    users = User.pluck(:email)
    mail(
      to: users,
      subject: '質問投稿完了メール',
      from: 'tomo.admin@example.com'
    )
  end

end
