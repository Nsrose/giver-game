Feature: Seeing Charities on the Play game
  As a user who is playing giving games
  So that I can understand the difference between the charities I’m voting for
  I want to be able to see their images, description etc. on the play games page
  
  Background:
    Given I am on the home page
    And the following games exist:
    | title                   | charityA_title | charityB_title | descriptionA                | descriptionB                |resource_id |
    | Game one                | Charity 1      | Charity 2      | 'bloop'                     | 'blop'                      |1           |
    | Game two                | Charity 3      | Charity 4      | 'Description for Charity 3' | 'Description for Charity 4' |2           |
    | Game three              | Charity 5      | Charity 6      | 'Description for Charity 5' | 'Description for Charity 6' |3           |
    And the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |

 Scenario: Become informed about each charity in the game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Game one" in my table
    When I follow "Game one" in my table
    Then I should be on the game page for "Game one"
    Then I should see "bloop"
    
  #Happy Path
  #Scenario: Users should be able to upload images
    #Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    #When I am on the new games page
    #And I fill out the form
    #And I upload an image called "img_1.png"
    #And I press "Submit New Game"
    #Then I should be on the home page
    #When I follow "Play a giving game"
    #And I follow "First Game" in my table
    #Then I should see the image "img_1.png"
  
  #Sad Path
  #Scenario: Users can only upload jpg, jpeg, png, and gif files
    #Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    #When I am on the new games page
    #And I fill out the form
    #And I upload an image called "not-an-image.pdf"
    #And I press "Submit New Game"
    #Then I should be on the new games page
    #Then I should see /You are not allowed to upload "pdf" files, allowed types: jpg, jpeg, gif, png/