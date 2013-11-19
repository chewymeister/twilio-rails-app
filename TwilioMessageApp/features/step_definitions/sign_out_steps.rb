Given(/^the user "(.*?)" has signed in with the password "(.*?)"$/) do |email, password|
  visit new_user_session_path
  sign_in email, password
end

Then(/^the user clicks the "(.*?)" link$/) do |link|
  click_link link
end

Then(/^the the user will not be on the new message path$/) do
  expect(current_path).to_not eq root_path
end