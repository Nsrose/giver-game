Feature: Make Games End
  As a user of the site who creates games
  So that games don’t exist past their expiration date or use more total money than I want
  I want to set expiration dates and money limits for games that control when they end

  Background:
    Given I am on the home page
    Given some charities exist
    And the following games exist:
    | title        | id | description                                 | expired | expiration_time          | total_money | per_transaction  | votesA | resource_id | charity_a_id     | charity_b_id|  is_private | user_id |
    | Expirein     |  1 | 'This game should expire'                   | true    |                          | 100         | 1                |        | 1           | 4                |1            |   false     | 1       |
    | Expire2      |  2 | 'This game should also expire'              | true    |            | 100         | 1                |        | 2           |1                 |2            |   false     | 1       |
    | Expire3      |  3 | 'This game should also expire too'          | false   |                          | 100         | 1                | 99     | 3           |2                 |4            |   false     | 1       |
   
    And the following users exist:
    | username           | id   |password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE  | 1    |TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |

  Scenario: Should not be able to play a game that is expired
    When I follow "Play a giving game"
    Then I should not see "Expirein"
    And I should not see "Expire2"
    
  Scenario: Create a game with an expiration field
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page 
    Then I should see "Expiration Date"
    And I should see "Goal Amount of Money to Reach"
  
  Scenario: If the game is expired, the game should not be played
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Play a giving game"
    And I follow "Expire3" in my table
    And I press "Donate to Schistosomiasis Control Initiative (SCI)"
    When I follow "Play Game"
    Then I should not see "Expire3"
    When I follow "View Expired Games"
    Then I should see "Expire3"
  