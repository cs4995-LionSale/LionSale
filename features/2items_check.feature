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
    Then I sell it



