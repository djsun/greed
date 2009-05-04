Feature: Computer players
  The computer players will play automatically
  
  Scenario: will see computers turn first
    Given I start a game
    Then I should see "Connie's Turn"
    And I should see "Your Turn"
