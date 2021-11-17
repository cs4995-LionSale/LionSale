Feature: the user can post items and check other's items

I want to check that the user can be able to post and update his/her items, and can see a list of
his/her items to sale. They can also check the items currently on sale. 


# Scenario: create user success A
# Given I have filled info and signed up as "alex@columbia.edu"
# Then I should be on the home page for "alex"

Scenario: Post first item
    Given I have login as "alex@columbia.edu"
    Then I should be on the home page for "alex"
    Then I sell item "My sofa"
    Then I should be on the new item page



