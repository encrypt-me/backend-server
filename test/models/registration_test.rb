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
require "test_helper"

class RegistrationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
