class RegistrationMailer < ActionMailer::Base
  default from: "Encrypt Me <no-ryply@encrypt-me.org>"

  include EncryptMeHelper
  def validation_code_message
    @registration = params[:registration]
    encrypted = EncryptMeHelper.encrypt_with_public_key(@registration.public_key, @registration.code)

    split = encrypted.split("\n")
    @encrypted_message = ""
    split.each do |line|
      @encrypted_message += "<div>#{line}</div>"
    end

    mail(to: @registration.email, subject: "Public Key Validation")
  end
end
