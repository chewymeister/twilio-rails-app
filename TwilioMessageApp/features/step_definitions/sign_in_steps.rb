Given(/^the user has no account on the database with the email "(.*?)"$/) do |email|
  expect(has_account? email).to be_false
end

When(/^the user goes to the sign up page at "(.*?)"$/) do |path|
  visit path
end

When(/^the user signs up with the email "(.*?)" and the password "(.*?)" with the password confirmation "(.*?)"$/) do |email, password, password_confirmation|
  sign_up name, email, password, password_confirmation
end

Then(/^the number of users will equal "(.*?)"$/) do |number|
  expect(User.count).to eq number.to_i
end