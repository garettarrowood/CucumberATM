class Account
  def deposit(amount)
    @balance = amount
  end
  def balance
    @balance
  end
end

CAPTURE_A_NUMBER = Transform(/^\$(\d+)$/) do |digits|
  digits.to_i
end

Given(/^I have deposited (#{CAPTURE_A_NUMBER}) in my account$/) do |amount|
  my_account = Account.new
  my_account.deposit(amount)
  expect(my_account.balance).to eq(amount), "Expected the balance to be #{amount} but it was #{my_account.balance}"
end

When(/^I request \$(\d+)$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^\$(\d+) should be dispensed$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
