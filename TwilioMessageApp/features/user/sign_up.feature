Feature: User signs up for an account

  A first time user should be able to sign up with just an email and a password

  Scenario: When the user has no account on the database
  Given the user has no account on the database with the email "test@test.com"
  When the user goes to the sign up page
  When the user signs up with the email "test@test.com" and the password "password" with the password confirmation "password"
  Then the number of users will equal "1"
  And the user now has an account on the database with the email "test@test.com"

  Scenario: When the user tries to sign up without an email
  When the user goes to the sign up page
  When the user signs up with no email and the password "test" with the password confirmation "test"
  Then the number of users will not equal "1"
  And sees the message "you must fill in your email"

