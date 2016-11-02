Feature: View results of games through profile
  As a user who created a giving game
  So that I can keep tab on the games I’ve made and their progress
  I want to be able to see the results of my games through my profile
    
  Scenario: See results of games created by a user
    Given some games and some users exist
    Given some charities exist
    And I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the user page for "j0e@tr8er.org"
    And I go to the results page for "Game 1"
    Then I should be on the results page for "Game 1"

  Scenario: Do not see results of games created by a different user
    Given some games and some users exist
    Given some charities exist
    And I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the user page for "j0e@tr8er.org"
    Then I should not see "Game 2"    