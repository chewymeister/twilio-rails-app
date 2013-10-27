Given(/^the user has an account on the database with the email "(.*?)"$/) do |email|
  expect(has_account? email ).to be_true
end

When(/^the user goes to the sign in page$/) do
  visit new_user_session_path
end

When(/^the user signs in with the email "(.*?)" and the password "(.*?)"$/) do |email, password|
  # raise(page.html)
  sign_in email, password
end

Then(/^the user will reach the index page$/) do
  expect(current_path).to eq root_path
end

Then(/^the user will see the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end