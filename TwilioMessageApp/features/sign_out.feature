Feature: User signs out
  @registered_user
  Scenario: When the user wishes to end their session
    Given the user "test@test.com" has signed in with the password "password"
    Then the user clicks the "Sign out" link
    And sees the message "Goodbye!"