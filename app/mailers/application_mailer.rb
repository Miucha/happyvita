class ApplicationMailer < ActionMailer::Base
  include SendGrid
  sendgrid_category :use_subject_lines
  default from: 'noreply@happyvita.com.br'
  layout 'mailer'
end
