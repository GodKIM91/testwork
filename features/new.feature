Feature: Login and start new topic https://gregory-test-guru.herokuapp.com/

  Scenario: I can login and create new topic
    Given I open a browser and navigate to start URL
    When I open login page
    And I enter email "admin@example.com" and password "123456"
    Then I can create new topic

    #some some