#User has no account

Given(/^the user has no account on the database with the email "(.*?)"$/) do |email|
  expect(has_account? email).to be_false
end

When(/^the user goes to the sign up page$/) do
  visit new_user_registration_path
end

When(/^the user signs up with the email "(.*?)" and the password "(.*?)" with the password confirmation "(.*?)"$/) do |email, password, password_confirmation|
  sign_up email, password, password_confirmation
end

Then(/^the number of users will equal "(.*?)"$/) do |number|
  expect(User.count).to eq number.to_i
end

Then(/^the user now has an account on the database with the email "(.*?)"$/) do |email|
  expect(has_account? email).to be_true
end

#When user signs up without email

When(/^the user signs up with no email and the password "(.*?)" with the password confirmation "(.*?)"$/) do |password, password_confirmation|
  sign_up('' , password, password_confirmation)
end

Then(/^the number of users will not equal "(.*?)"$/) do |number|
  expect(User.count).to_not eq number
end

Then(/^the user sees the message "(.*?)"$/) do |message|
  expect(page).to have_content message
end
