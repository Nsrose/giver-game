Feature: Improvements to the create game page
  As a game creator
  So I can see and understand what options I'm selecting
  I should see charity information and game information in an intuitive format.

  Background:
  
    Given the following games exist:
    | title       | description                                | per_transaction | resource_id | is_private | charity_a_id  | charity_b_id
    | First game  | something something                        |      10         | 1           | false      | 1             | 2
    | Second game | something something else                   |      1          | 2           | false      | 1             | 2
  
    Given the following users exist:
    | username           | password   | password_confirmation  |     email             |
    | Traitor_JOSEPHINE   | TRAITORJOE |  TRAITORJOE            |  j0e@tr8er.org        |

    Given some charities exist

  Scenario: Show charity info when selecting two charities
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I select "Against Malaria Foundation" from "game_default_charity_a"
    Then I should see "Malaria is one of the leading killers"
    And I should see the image "https://www.againstmalaria.com/images/logo_AMF.gif"
    And I select "Schistosomiasis Control Initiative (SCI)" from "game_default_charity_b"
    Then I should see "500 million people throughout sub-Saharan"
    And I should see the image "http://www3.imperial.ac.uk/newseventsimages?p_image_type=mainnews2012&p_image_id=35469"

  Scenario: Charity info should be dynamic
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I select "Against Malaria Foundation" from "game_default_charity_a"
    Then I should see "Malaria is one of the leading killers"
    And I should not see "GiveDirectly transfers cash to"
    And I should see the image "https://www.againstmalaria.com/images/logo_AMF.gif"
    And I should not see the image "https://cdn.givedirectly.org/8fa1cf088be076b2943084a6efe2b7ab/asic-income-link.jpg"
    Then I select "GiveDirectly" from "game_default_charity_a"
    And I should see "GiveDirectly transfers cash to"
    And I should not see "Malaria is one of the leading killers"
    And I should see the image "https://cdn.givedirectly.org/8fa1cf088be076b2943084a6efe2b7ab/basic-income-link.jpg"
    And I should not see the image "https://www.againstmalaria.com/images/logo_AMF.gif"

  Scenario: Default image should display for charities without an image
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    And I select "CharityNoImage" from "game_default_charity_a"
    Then I should see "A Charity without an image"
    And I should see the image "./assets/images/default-image1.png"

  Scenario: Goal amount and per-person amount should be centered
    Given I am logged in as "j0e@tr8er.org" with password "TRAITORJOE"
    When I am on the new games page
    Then I should see "Goal Amount of Money to Reach" in "goal" centered
    And I should see "Per Person Amount" in "per_person" centered