Feature: Create a new game
  As a user of this great site
  I want to be able to create a new giving game
  So that I can start my own giving game with my selected charities

  Background:
  
    Given the following games exist:
    | title       | description                                | per_transaction | charityA_title | charityB_title | resource_id |
    | First game  | something something                        |      10         | A charity      | what           | 1           |
    | Second game | something something else                   |      1          | Another one    | cold           | 2           |
  
    Given the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |

  Scenario: Create the first game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Giving Game First Game successfully created."
  
  Scenario: Create the second game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form with a second game
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Giving Game New Game successfully created."
    
  Scenario: Check for both games in the index page
    When I am on the existing games page
    Then I should see: "First game", "Second game", "$10", "$1"
    Then I should see only "2" games
    
  Scenario: Forms should show errors for blank inputs
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And the form is blank
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "can't be blank"
    
  Scenario: Forms should not allow alphabet values for Money
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form
    And I fill in "TotalMoney" with "Money"
    And I fill in "AmountPerVote" with "Munnay"
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "is not a number"

  Scenario: Forms should not allow non-numeric symbols for Money
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form
    And I fill in "TotalMoney" with "^*(#"
    And I fill in "AmountPerVote" with "[]@)$0_"
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "is not a number"

  Scenario: Forms should not allow negative value for Money
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form with negative numbers
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "must be greater than or equal to 0"

  Scenario: Try creating another game with same name
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    When I fill out the form
    And I fill in "Title" with "First game"
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "Title has already been taken"
    
  Scenario: Cannot create a new game when not logged in
    Given I am on the home page
    When I follow "Create New Game"
    Then I should be on the sign in page
    And I should see "You must be logged in to create a new giving game"
    
  Scenario: Incorrectly added forms should not clear the rest of the fields
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Create New Game"
    When I fill out the form
    And I fill in "TotalMoney" with "Money"
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "is not a number"
    Then I should see "Descriptive description to describe"


