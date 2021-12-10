Feature: the user can message each other about deal information
  
  I want to check that any user can send messages to any other user, and the messages are visible to both parties

Scenario: Create item to sell
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "alex"
    Then I sell item
    Then I should be on the new item page
    Then I putin itemtitle "Some sofas"
    Then I putin itemprice 10
    Then I putin itemquant 3
    Then I putin itemcat All
    Then I sell it

Scenario: Send message
    Given I have login as "cat@columbia.edu"
    Then I should be on the third home page for "Cat"
    Then I goto items page
    Then I write message I like your sofas
    Then I send message

Scenario: Receive message
    Given I have login as "cat@columbia.edu"
    Then I should be on the third home page for "Cat"
    Then I check my messages
    Then I screenshot
    Then I should see "I like your sofas"