Given(/^the user "(.*?)" has signed in with the password "(.*?)"$/) do |email, password|
  visit new_user_session_path
  sign_in email, password
end

Then(/^the user clicks the "(.*?)" link$/) do |link|
  # raise(current_path)
  click_link link
end

Then(/^sees the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end