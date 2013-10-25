Feature: Sending a message using the Twilio API
  
  The user should be able to send a simple message to a given phone number

  Scenario: Phone number is valid
    When I enter the phone number +15005550006
    And I enter the message "Hello, world"
    And I click the button "Send Message" to submit the form
    Then I should receive the message "Message successfully sent"
