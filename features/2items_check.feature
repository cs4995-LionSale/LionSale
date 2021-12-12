Feature: the user can post items and check other's items

I want to check that the user can be able to post and update his/her items, and can see a list of
his/her items to sale. They can also check the items currently on sale. 

Scenario: Post first item
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "alex"
    Then I sell item
    Then I should be on the new item page
    Then I putin itemtitle "My sofa"
    Then I putin itemprice 1
    Then I putin itemquant 1
    Then I putin itemcat All
    Then I sell it

Scenario: Post second item
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "alex"
    Then I sell item
    Then I should be on the new item page
    Then I putin itemtitle "Ikea chair"
    Then I putin itemprice 3
    Then I putin itemquant 2
    Then I putin itemcat Books
    Then I sell it

Scenario: List items
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "alex"
    Then I goto items page
    Then I should be on the items page
    Then I sleep
    Then I should see "My sofa"
    
    Then I should see "Ikea chair"

Scenario: Check category of items
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "alex"
    Then I goto categories page
    Then I go to All category
    Then I should see "My sofa"
    Then I should see "Ikea chair"
    Then I goto categories page
    Then I go to Books category
    Then I should not see "My sofa"
    Then I should see "Ikea chair"
    Then I goto categories page
    Then I go to Furniture category
    Then I should not see "My sofa"
    Then I should not see "Ikea chair"
    
Scenario: Edit my items and then delete
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "alex"
    Then I goto update item
    Then I should see "My sofa"
    Then I should see "Ikea chair"
    Then I update item 
    Then I putin itemtitle "Ikea sofa"
    Then I putin itemprice 2
    Then I putin itemquant 1
    Then I edit item
    Then I goto items page
    Then I should see "My sofa"
    Then I should see "Ikea sofa"
    Then I goto update item
    Then I delete item
    Then I should be on the home page for "alex"
    Then I goto items page
    Then I should see "Closed by seller."
