Feature: Archive
  As a user of the site who creates games
  So that I can look at old games as examples
  I want to be able to view the archive of expired giving games
  
  Background: Games exist
    Given I am on the home page
    Given some charities exist
    And the following games exist:
    | title                   | description                                 | votesA | votesB | show_results | expired | resource_id |charity_a_id  |charity_b_id     | is_private |
    | Tutorial                | 'This is the tutorial for the Giving Game'  | 0      | 100    | true         | true    | 1           |1             |2                | false      |
    | NoShow                  | 'This is a game without showing results on' | 100    | 0      | false        | true    | 2           |4             |2                | false      |
    
  Scenario: Should see expired games on the archive page
    When I follow "View Expired Games"
    Then I should be on the archive page
    And I should see "Tutorial" in my table
    And I should see "NoShow" in my table

  Scenario: Clicking on an expired game with show_results set to false 
    When I follow "View Expired Games"
    And I follow "NoShow" in my table
    Then I should be on the results page for "NoShow"
      And I should not see "Money Remaining"

  Scenario: Clicking on an expired game with show_results set to true
    When I follow "View Expired Games"
    And I follow "Tutorial" in my table
    Then I should be on the results page for "Tutorial"
    And I should see "Money Remaining"
    

    