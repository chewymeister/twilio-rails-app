Feature: User signs out
  @registered_user
  Scenario: The user signs out
    Given the user "test@test.com" has signed in with the password "test"
    Then the user clicks the "Sign out" link
    And sees the message "Goodbye!"