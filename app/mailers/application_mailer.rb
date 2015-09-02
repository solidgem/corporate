class ApplicationMailer < ActionMailer::Base
  default from: Figaro.env.mail_sender_address
  layout 'mailer'
  helper :application
end
