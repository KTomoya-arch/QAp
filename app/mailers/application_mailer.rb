class ApplicationMailer < ActionMailer::Base
   default to: 'aiueo',
   from: 'tomoya@example.com'
  layout 'mailer'
end
