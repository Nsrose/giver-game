Feature: See Results of a Game
 As a User
 So that I know the progress of a game
 I want to clearly see how much money has been assigned to each charity
 
 
 Scenario: Show Charity Image on Results Page
   Given some games and some users exist:
   And I go to the results page for "Game 1"
   Then I should see the images for "Game 1"
   
Scenario: See Results of Votes
   Given some games and some users exist:
   And I go to the results page for "Game 1"
   And I should see "Money Remaining: $10"
   And I should see "Charity A: $0"
   And I should see "Charity B: $0"
   
Scenario: Redirect to Results Page after Playing Game
  Given some games and some users exist:
  And I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
  And I am on the game page for "Game 1"
  And I press "Donate to Charity A"
  Then I should be on the results page for "Game 1"
  When I go to the game page for "Game 1"
  Then I should be on the results page for "Game 1"
  
  