Feature: User signs up for an account

  A first time user should be able to sign up with just an email and a password

  Scenario: When the user has no account on the database
  Given the user has no account on the database with the email "test@test.com"
  When the user goes to the sign up page
  When the user signs up with the email "test@test.com" and the password "password" with the password confirmation "password"
  Then the number of users will equal "1"
  And the user now has an account on the database with the email "test@test.com"

  