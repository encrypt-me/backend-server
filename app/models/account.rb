# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  email      :string(512)
#  public_key :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < BaseRecord
  validates :email, presence: true, length: { maximum: 512 }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
