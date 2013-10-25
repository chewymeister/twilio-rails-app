When(/^I enter the phone number \+(\d+)$/) do |number|
  @number = number
  fill_in 'Number', with: number
end

When(/^I enter the message "(.*?)"$/) do |text|
  @message = message
  fill_in 'Message', with: text
end

When(/^I click the button "(.*?)" to submit the form$/) do |button|
  click_button button
end


Then(/^I should receive the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end

