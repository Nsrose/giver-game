Feature: Edit existing giving games
  As a user who made a giving game
  So that I can provide new updated information on my existing and current giving games
  I want to be able to edit my giving game
  
  Background: Users with games exist
    Given some charities exist
    Given some games and some users exist:
    
    #Happy Path
    Scenario: Edit a game
      Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
      When I am on the user page for "j0e@tr8er.org"
      And I go to the edit page for "Game 1"
      And I fill in "Title" with "Game 1000"
      And I press "Submit Changes"
      And I should see "Successfully edited."

    Scenario: Edit a game leaving title as is
      Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
      When I am on the user page for "j0e@tr8er.org"
      And I go to the edit page for "Game 1"
      And I fill in "TotalMoney" with "1000"
      And I press "Submit Changes"
      And I should see "Successfully edited."

    #Sad Path
    Scenario: Attempt to edit a game to a name that already exists
      Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
      When I am on the user page for "j0e@tr8er.org"
      And I go to the edit page for "Game 1"
      And I fill in "Title" with "Game 2"
      And I press "Submit Changes"
      And I should see "Title has already been taken"
      
    Scenario: Attempt to edit a game with invalid values
      Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
      When I am on the user page for "j0e@tr8er.org"
      And I go to the edit page for "Game 1"
      And I fill in "TotalMoney" with "alotofmoney"
      And I press "Submit Changes"
      And I should see "is not a number"