Feature: the user enters the LionSale app
  
  I want to check that the user can successfully register, log in and see the page.
  I also want to see and update my user profile in the web application


Scenario: create user success
Given I have filled info and signed up as "alex@columbia.edu"
Then I should be on the home page for "alex"

Scenario: cannot create same user twice
Given I have filled info and signed up as "alex@columbia.edu"
  Then I should be on the register page

# Scenario: create long user failure
#   Given I have filled info and signed up long as "alex@columbia.edu"
#   Then I should be on the register page

# Scenario: create bad email failure1
# Given I have filled info and signed up long as "aaaaaaaaaaaxcolumbia.edu"
#   Then I should be on the register page

# Scenario: create bad email failure2
# Given I have filled info and signed up long as "aaaaaaaaaaa@columbia@columbia.edu"
#   Then I should be on the register page

  
Scenario: login success1 
  Given I have login as "alex@columbia.edu"
  Then I should be on the home page for "Alex"
  
Scenario: update profile 1
  Given I have login as "alex@columbia.edu"
  Then I should be on the home page for "Alex"
  Then I go to update profile
  Then I put in new email as "aa@columbia.edu"
  Then I put in new address as "222 abc st."
  Then I put in new name as "Alex1"
  Then I update
  Then I should be on the home page for "Alex1"

# Scenario: login success2
#   Given I am on the login page
#   And I fill in "username" with "Alex"
#   And I fill in "password" with "abc"
#   And I press "Login"
#   Then I should see "success"
#   Then I should be on the profile page for "Alex"

Scenario: login failure
  Given I have login as "ggg@columbia.edu"
  Then I should be on the login page

Scenario: Logout A
  Given I have login as "aa@columbia.edu"
  Then I logout
  Then I should be on the slash page

# Scenario: Logout B
#   Given I am on the profile page for "Bill"
#   And I press "Logout"
#   Then I should be on the login page
#   And I should not see "Bill"

# Scenario: Login and register
#   Given I am on the register page
#   Then I press "Login"
#   Then I should be on the login page
#   Then I press "Register"
#   Then I should be on the register page

