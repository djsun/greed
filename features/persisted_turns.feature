Feature:
  As a user I would like everyone's turns persisted
  instead of being generated everytime the page 
  is loaded

  Scenario: Same results
    Given I start a game
    And I look at the total score for Connie
    And I refresh the screen
    Then the total score for Connie is unchanged
