class RegistrationMailer < ActionMailer::Base
  default from: "no-reply@encrypt-me.org"

  def validation_code_message
    @registration = params[:registration]
    mail(to: @registration.email, subject: "Public Key Validation")
  end
end
