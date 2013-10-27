@registered_user
Feature: User signs in

  Scenario: with the correct password
  Given the user has an account on the database with the email "test@test.com"
  When the user goes to the sign up page at "/sessions/new"
  When the user signs in with the email "test@test.com" and the password "test"
  Then the user will reach the quizzes index page located at "/quizzes"
  And the user will see the message "Welcome test! Please choose a quiz to play."