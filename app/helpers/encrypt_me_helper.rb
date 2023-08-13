module EncryptMeHelper
  def self.encrypt_with_public_key(public_key, message)
    path = ENV['ENCRYPT_ME_TOOL_PATH']
    command = "python3 #{path} -ec --message \"#{message}\""
    IO.popen(command, 'r+') do |pipe|
      pipe.puts(public_key)
      pipe.close_write
      return pipe.read
    end
  end
end
