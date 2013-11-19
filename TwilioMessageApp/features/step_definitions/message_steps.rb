Given(/^I am on the new message page$/) do
  # expect(User.count).to eq 1
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

# USER MUST BE SIGNED IN TO SEND A TEXT MESSAGE
Given(/^I visit the root page without signing in$/) do
  visit root_path
end

Then(/^I should see the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end


