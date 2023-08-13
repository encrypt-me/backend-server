module EncryptMeHelper
  def self.get_encrypt_me_path
    path = ENV['ENCRYPT_ME_TOOL_PATH']
    return path
  end

  def self.encrypt_with_public_key(public_key, message)
    path = EncryptMeHelper.get_encrypt_me_path
    command = "python3 #{path} -ec --message \"#{message}\""
    IO.popen(command, 'r+') do |pipe|
      pipe.puts(public_key)
      pipe.close_write
      return pipe.read
    end
  end

  def self.get_random_public_key
    path = EncryptMeHelper.get_encrypt_me_path
    command = "python3 #{path} -gpk"
    IO.popen(command, 'r+') do |pipe|
      pipe.puts(public_key)
      pipe.close_write
      return pipe.read
    end
  end
end
