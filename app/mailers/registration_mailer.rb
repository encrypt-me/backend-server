class RegistrationMailer < ActionMailer::Base
  default from: "Encrypt Me <no-ryply@encrypt-me.org>"

  include EncryptMeHelper
  def validation_code_message
    @registration = params[:registration]
    @encrypted_code = EncryptMeHelper.encrypt_with_public_key(@registration.public_key, @registration.code)

    @encrypted_code = @encrypted_code.gsub("\n", "</br>")

    mail(to: @registration.email, subject: "Public Key Validation")
  end
end
