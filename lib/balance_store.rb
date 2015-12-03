require 'fileutils'
class BalanceStore
  def initialize
    self.balance = 0
  end

  def balance
    File.read('balance').to_i
  end

  def balance=(new_balance)
    File.open('balance', 'w') { |f|
      f.puts(new_balance)
    }
  end
end

