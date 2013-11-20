@registered_user
Feature: User signs out
  
  Scenario: When the user wishes to end their session
    Given the user "test@test.com" has signed in with the password "password"
    When the user clicks the "Sign out" link
    Then the the user will not be on the new message path