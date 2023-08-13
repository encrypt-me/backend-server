# == Schema Information
#
# Table name: registrations
#
#  id         :bigint           not null, primary key
#  email      :string(512)
#  public_key :text(65535)
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Registration < BaseRecord
  validates :email, presence: true, length: { maximum: 512 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  after_create :create_validation_code

  def create_validation_code
    self.code = SecureRandom.hex(32)
    self.save

    # TODO: code should be encrypted with public key to validate whole process
    RegistrationMailer.with(registration: self).validation_code_message.deliver_now
  end
end
