Given(/^I am on the new message page located at "(.*?)"$/) do |arg1|
  visit root_path
end

When(/^I enter the phone number "(.*?)"$/) do |number|
  @number = number
  fill_in "Number", with: number
end

When(/^I enter the message "(.*?)"$/) do |content|
  @message = message
  fill_in 'Content', with: content
end

When(/^I click the button "(.*?)" to submit the form$/) do |button|
  click_button button
end


Then(/^I should receive the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end

