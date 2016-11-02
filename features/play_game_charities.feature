Feature: Seeing Charities on the Play game
  As a user who is playing giving games
  So that I can understand the difference between the charities I’m voting for
  I want to be able to see their images, description etc. on the play games page
  
  Background:
    Given I am on the home page
    Given some games and some users exist
    Given some charities exist

 Scenario: Become informed about each charity in the game
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I follow "Play a giving game"
    And I should be on the existing games page
    Then I should see "Game 1" in my table
    When I follow "Game 1" in my table
    Then I should be on the game page for "Game 1"
    Then I should see "Malaria is one of the leading killers"
    
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