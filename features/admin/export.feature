Feature: Exporting yaml
  In order to collect data
  As a user
  I should be able to export YAML
  
  Scenario Outline: Anyone can export YAML
    Given I am logged in as "<username>"
    When I go to the export page
    Then I should see "id:"
    
    Examples:
      | username  |
      | admin     |
      | existing  |
      | another   |
      | designer |