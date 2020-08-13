class ApprovalMailer < ApplicationMailer
	default from: 'getjobs4urself@gmail.com'
	def welcome_email(message,email,subject)
    @email = email
    @input_message = message
    @subject = subject
    mail(to: @email, subject: @subject)
  end
end
