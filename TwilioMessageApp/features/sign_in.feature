@registered_user
Feature: User signs in

  Scenario: with the correct password
  Given the user has an account on the database with the email "test@test.com"
  When the user goes to the sign in page
  When the user signs in with the email "test@test.com" and the password "password"
  Then the user will reach the index page
  And the user will see the message "Welcome test@test.com! Choose a valid mobile number to send a text message to!"