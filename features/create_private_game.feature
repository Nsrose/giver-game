Feature: Create private game
    As a game creator
    I want to create private games
    So that only my friends can vote on which charity my money goes towards
Background:

  Given the following games exist:
  | title       | description                                | per_transaction | charityA_title | charityB_title | resource_id |
  | First game  | something something                        |      10         | A charity      | what           | 1           |
  | Second game | something something else                   |      1          | Another one    | cold           | 2           |

  Given the following users exist:
  | username           | password   | password_confirmation  |     email             |
  | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |
 
  Scenario: Create the third (private) game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I create a private game called "Secret New Game"
    Then I should see "Giving Game Secret New Game successfully created. Your private game URL: "
    When I go to the existing games page
    Then I should not see "Secret New Game"
    Then I should see only "2" games
    When I go to the user page for "j0e@tr8er.org"
    Then I should see "Secret New Game"
    Then I should see "Public" appear "0" times
    Then I should see "Private" appear "1" time
    
  Scenario: Create the third (public) game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I create a game called "Not Secret New Game"
    Then I should see "Giving Game Not Secret New Game successfully created."
    When I go to the existing games page
    Then I should see "Not Secret New Game"
    Then I should see only "3" games
    When I go to the user page for "j0e@tr8er.org"
    Then I should see "Not Secret New Game"
    Then I should see "Public" appear "1" time
    Then I should see "Private" appear "0" times