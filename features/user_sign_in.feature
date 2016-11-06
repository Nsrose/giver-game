Feature: As a user who wants to access certain pages
  So that I can access the page I wanted to get to
  I want to be redirected to my destination page after logging in

  Background:
    Given I am on the home page
    Given some games and some users exist
    Given some charities exist

  Scenario: A user attempting to access the play game page should be redirected
    When I follow "Play a giving game"
    And I follow "Game 1" in my table
    Then I should be on the sign in page
    When I fill in "user_login" with "j0e@tr8er.org"
    When I fill in "user_password" with "TRAITORJOE"
    When I press "log-in"
    Then I should see "Signed in successfully."
    Then I should be on the game page for "Game 1"


  Scenario: A user attempting to create a game should be redirected
    Given I am on the home page
    When I follow "Create New Game"
    Then I should be on the sign in page
    When I fill in "user_login" with "j0e@tr8er.org"
    When I fill in "user_password" with "TRAITORJOE"
    When I press "log-in"
    Then I should see "Signed in successfully."
    Then I should be on the new games page