Feature: Game creators see default list of charities
As a game creator
I want to see a default list of charities to select from on the game create page
So that I can select from a default list of charities
Also, I cannot edit the "description" or "image" fields.

Background:     
  Given the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |
    Given the following charities exist:
      |charityName | ein | description 
      | We Do Good | 492 | Read the title.
      | Cars4KidsAsInBabyGoatKids | 301 | Don't be a baaad driver.
 Scenario: Create a game with proper forms
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form with values "Title": "Secret New Game","Description": "Descriptive description to describe","TotalMoney": "100","AmountPerVote": "10"
    When I select "We Do Good" from the "charity_a" dropdown list
    When I select "Cars4KidsAsInBabyGoatKids" from the "charity_b" dropdown list
    Then I should see "Read the title."
    Then I should see "Don't be a baaad driver."
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Giving Game First Game successfully created with charities 'We Do Good' and 'Cars4KidsAsInBabyGoatKids'."
    
Scenario: Ensure game is not allowed to be created if we do not select a charity B
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form with values "Title": "Secret New Game","Description": "Descriptive description to describe","TotalMoney": "100","AmountPerVote": "10"
    When I select "We Do Good" from the "charity_a" dropdown list
    Then I should see "Read the title."
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "Charity B not specified"
    
Scenario: Ensure game is not allowed to be created if we do not select a charity A
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form with values "Title": "Secret New Game","Description": "Descriptive description to describe","TotalMoney": "100","AmountPerVote": "10"
    When I select "We Do Good" from the "charity_b" dropdown list
    Then I should see "Read the title."
    And I press "Submit New Game"
    Then I should be on the new games page
    And I should see "Charity A not specified"

 Scenario: Ensure game is not created if we choose the same charity.
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I fill out the form with values "Title": "Secret New Game","Description": "Descriptive description to describe","TotalMoney": "100","AmountPerVote": "10"
    When I select "We Do Good" from the "charity_a" dropdown list
    When I select "We Do Good" from the "charity_b" dropdown list
    Then I should see "Read the title."
    Then I should see "Don't be a baaad driver."
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Charities A and B must be different"