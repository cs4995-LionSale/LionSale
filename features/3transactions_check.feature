Feature: the user can buy stuffs via the transactions interface

I want to check that the user can create a transaction when he/she sees a transaction, and the transactions can be 
modified in certain conditions. Each transaction symbolize a buy-sell relationship. 

Scenario: Create item to sell
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "alex"
    Then I do geolocation
    Then I sell item
    Then I should be on the new item page
    Then I putin itemtitle "Some book"
    Then I putin itemprice 6
    Then I putin itemquant 2
    Then I putin itemcat All
    Then I sell it

Scenario: Create and check Transaction requests
    Given I have login as "cat@columbia.edu"
    Then I should be on the third home page for "Cat"
    Then I goto items page
    Then I buy item
    Then I should be on the transactions page
    Then I goto my transactions
    Then I should see "Some book"
    Then I should see "6.0"
    Then I should see "alex"
    Then I should see "100 100st."
    Then I should see "Purchase request sent. Waiting for response."
    Then I check details
    Then I should see "Some book"
    Then I should see "6.0"
    Then I should see "alex"
    Then I should see "100 100st."
    Then I should see "Purchase request sent. Waiting for response."

Scenario: Create request 2
    Given I have login as "dog@columbia.edu"
    Then I should be on the fourth home page for "dog"
    Then I goto items page
    Then I buy item
    Then I should be on the transactions page
    Then I goto my transactions
    Then I should see "Some book"
    Then I should see "6.0"
    Then I should see "alex"
    Then I should see "100 100st."
    Then I should see "Purchase request sent. Waiting for response."
    Then I check details
    Then I should see "Some book"
    Then I should see "6.0"
    Then I should see "alex"
    Then I should see "100 100st."
    Then I should see "Purchase request sent. Waiting for response."

Scenario: Cancel  requests
    Given I have login as "dog@columbia.edu"
    Then I should be on the fourth home page for "dog"
    Then I goto items page
    Then I goto my transactions
    Then I check details
    Then I cancel transaction
    Then I goto my transactions
    Then I should not see "Purchase request sent. Waiting for response."

Scenario: Seller confirmation
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "Alex"
    Then I goto items page
    Then I goto my transactions
    Then I should see "Some book"
    Then I should see "6.0"
    Then I should see "alex"
    Then I should see "100 100st."
    Then I check details
    Then I confirm transaction
    Then I should not see "Approve Purchase Request"
    Then I should see "Waiting for deal confirmation..."

Scenario: Buyer confirmation
    Given I have login as "cat@columbia.edu"
    Then I should be on the third home page for "Cat"
    Then I goto items page
    Then I goto my transactions
    Then I check details
    Then I should see "Waiting for deal confirmation..."
        Then I screenshot

    Then I confirm deal
    Then I screenshot
    Then I goto my transactions
    Then I should see "Waiting for deal confirmation..."

Scenario: Final confirmation
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "Alex"
    Then I goto items page
    Then I goto my transactions
    Then I should see "Some book"
    Then I should see "6.0"
    Then I should see "alex"
    Then I should see "100 100st."
    Then I check details
        Then I screenshot

    Then I confirm deal

