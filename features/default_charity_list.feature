Feature: Game creators see default list of charities
As a game creator
I want to see a default list of charities to select from on the game create page
So that I can select from a default list of charities
Also, I cannot edit the "description" or "image" fields.

Background:     
  Given the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |
  Given some charities exist

Scenario: Create a game with proper forms
  Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
  When I am on the new games page
  And I fill out the form with values "Title": "Secret New Game","Description": "Descriptive description to describe","TotalMoney": "100","AmountPerVote": "10"
  When I select "Against Malaria Foundation" from "game_charity_a_id"
  When I select "GiveDirectly" from "game_charity_b_id"
  And I press "Submit New Game"
  Then I should be on the home page

Scenario: Ensure game is not created if we choose the same charity.
  Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
  When I am on the new games page
  And I fill out the form with values "Title": "Secret New Game","Description": "Descriptive description to describe","TotalMoney": "100","AmountPerVote": "10"
  When I select "Deworm the World Initiative" from "game_charity_a_id"
  When I select "Deworm the World Initiative" from "game_charity_b_id"
  And I press "Submit New Game"
  Then I should be on the new games page
  And I should see "Charities A and B must be different"