module KnowsTheUserInterface

  class UserInterface
    include Capybara::DSL

    def withdraw_from(account, amount)
      Sinatra::Application.account = account
      visit '/'
      fill_in 'Amount', with: amount
      click_button 'Withdraw'
    end
  end

  def my_account
    @my_account ||= Account.new
  end

  def cash_slot
    Sinatra::Application.cash_slot
  end

  def teller
    @teller ||= UserInterface.new
  end
end
World(KnowsTheUserInterface)

module DelayedJobSupport
  def process_all_jobs
    Delayed::Worker.new.work_off(Delayed::Job.count) 
    if ENV['FAIL_FAST']
      raise Delayed::Job.first.last_error if Delayed::Job.count > 0
    end
  end
end
World(DelayedJobSupport)




