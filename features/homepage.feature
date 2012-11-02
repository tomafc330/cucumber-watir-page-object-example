Feature: Bit.ly home features test
  We want to ensure tha the bitly homepage works.

  Scenario: Click on registration form
    Given I click to the Home Page
    When I click the Register Link
    Then I should be taken to the registration page

  Scenario: Create registration then login
    Given I am on the Registration Page
    When I fill in the values using a random profile
    And I click submit
    Then I should see the success page

  @current
  Scenario: Create registration when passwords don't match
    Given I am on the Registration Page
    When I fill in the values using a default profile
    And I click submit
    Then I should see the error on password field with text "Passwords don't match"

