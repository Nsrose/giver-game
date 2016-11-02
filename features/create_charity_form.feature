Feature: Adding Charity Fields to Forms
  As a user who wants to create giving games
  So that I can provoke critical thinking about charities
  I want to have more fields to add images and descriptions for charities
  
Background:
  Given some charities exist
  Given the following users exist:
  | username            | password   | password_confirmation  |     email           |
  | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org      |

  Scenario: Create a giving game with descriptions for each charity
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    When I fill out the form without descriptions
   # And I fill in "DescriptionA" with "Description 1."
  #  And I fill in "DescriptionB" with "Description 2."
    #And I upload an image called "img_1.png"
    And I press "Submit New Game"
    Then I should be on the home page
    And I should see "Giving Game First Game successfully created."
 
