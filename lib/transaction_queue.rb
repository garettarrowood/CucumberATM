require 'fileutils'

class TransactionQueue
  def initialize
    FileUtils.rm_rf('messages')
    FileUtils.mkdir_p('messages')
    @next_id = 1
  end

  def write(transaction)
    File.open("messages/#{@next_id}", 'w') { |f|
      f.puts(transaction)
    }
    @next_id +=1
  end

  def read
    next_message_file = Dir['messages/*'].first
    return unless next_message_file
    yield File.read(next_message_file)
    FileUtils.rm_rf(next_message_file)
  end
end