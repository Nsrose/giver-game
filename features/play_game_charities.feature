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
    Then I should see the image "http://www.againstmalaria.com/images/logo_AMF_Square.png"
    Then I should see the link named "Against Malaria Foundation Homepage" to "https://www.againstmalaria.com/Default.aspx"
    
  Scenario: Charity without image link shows default image
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I go to the game page for "Game 4" 
    Then I should see an image with the class "default_image_A"
    
    
