Given(/^I am on the new message page$/) do
  visit root_path
end

When(/^I enter the phone number "(.*?)"$/) do |number|
  fill_in "Number", with: number
end

When(/^I enter the message "(.*?)"$/) do |content|
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

Given(/^I sign in as a user$/) do
  visit new_user_session_path
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: 'password'
  click_button 'Sign in'
end
