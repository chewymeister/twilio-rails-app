Feature: Sending a message using the Twilio API
  
  The user should be able to send a simple message to a given phone number

  Scenario: Phone number is valid
    Given I am on the new message page located at "new_message_path"
    When I enter the phone number "+447735989592"
    And I enter the message "Hello, world"
    And I click the button "Send Message" to submit the form
    Then I should receive the message "Your message was successfully sent"

  Scenario: Phone number is invalid
    Given I am on the new message page located at "new_message_path"
    When I enter the phone number "+15005550001"
    And I enter the message "Hello, world"
    And I click the button "Send Message" to submit the form
    Then I should receive the message "Message did not send successfully, please try again"