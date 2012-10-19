Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

  Scenario: User has omniauth login but no email
    Given Twitter User is logged in
    Then I should see an email prompt
    And I enter an email and a password
    Then I should be on the root page

  Scenario: User is not signed up
    Given I do not exist as a user
    When I sign in with valid credentials
    Then I see an invalid login message
    And I should be signed out

  Scenario: User signs in successfully
    Given I exist as a user
    And I am not logged in
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in

  Scenario: User enters wrong email
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong email
    Then I see an invalid login message
    And I should be signed out

  Scenario: User enters wrong password
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong password
    Then I see an invalid login message
    And I should be signed out

  Scenario: User is banned
    Given I exist as a banned user
    And I am not logged in
    When I sign in with valid credentials
    Then I should see that I am banned
    And I should be signed out

  Scenario: User's IP is banned
    Given I exist as a user
    And I am not logged in
    And another user with my IP address is banned
    When I sign in with valid credentials
    Then I should see that I am banned
    And I should be signed out

  Scenario: User's IP is banned and the User is elevated
    Given I exist as a user
    And I am an admin
    And I am not logged in
    And another user with my IP address is banned
    When I sign in with valid credentials
    Then I should be signed in
