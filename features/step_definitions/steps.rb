Given(/^my account has been credited with (#{CAPTURE_CASH_AMOUNT})$/) do |amount|
  my_account.credit(amount)
end

When(/^I withdraw (#{CAPTURE_CASH_AMOUNT})$/) do |amount|
  teller.withdraw_from(my_account, amount)
end

Then(/^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/) do |amount|
  expect(cash_slot.contents).to eq(amount)
end

Then(/^the balance of my account should be (#{CAPTURE_CASH_AMOUNT})$/) do |amount|
  #async_support's module loads, but when an error is raised in the block below, it immediately exits and doesn't go back to the module for the rescue.
  eventually { expect(my_account.balance).to eq(amount) }
end





