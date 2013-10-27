Given(/^the user has an account on the database with the email "(.*?)"$/) do |email|
  expect(has_account email ).to be_true
end

When(/^the user goes to the sign up page at "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^the user signs in with the email "(.*?)" and the password "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^the user will reach the quizzes index page located at "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the user will see the message "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end