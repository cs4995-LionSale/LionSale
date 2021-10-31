Feature: the user enters the LionSale app
  
  I want to check that the user can successfully register, log in and see the page.
  I also want to see and update my user profile in 
  
Scenario: create user success
  Given the following users do not exist: 
| name        | email | password     | address |
| Alex    | aaa@columbia.edu     | abc | 333 Amsterdam Ave. |
  And I am on the register page
  And I fill in "username" with "Alex"
  And I fill in "email" with "aaa@columbia.edu"
  And I fill in "password" with "abc"
  And I press "Register"
  Then I should see "success"
  Then I shoud be on the profile page for "Alex"

Scenario: create user failure
  Given the following users exist: 
| username        | email | password_digest     | address |
| Alex    | aaa@columbia.edu     | abc | 333 Amsterdam Ave. |
| Bill    | bbb@columbia.edu     | mypassword | 6000 W 120 St. |
  And I am on the register page
  And I fill in "username" with "Alex"
  And I fill in "email" with "aaa@columbia.edu"
  And I fill in "password" with "abc"
  And I press "Register"
  Then I should see "failure"
  Then I shoud be on the register page
  Then I fill in "username" with "Bill"
  And I fill in "email" with "aaa@columbia.edu"
  And I fill in "password" with "mypass"
  And I press "Register"
  Then I should see "failure"
  Then I shoud be on the register page

Scenario: create long user failure
  Given I am on the register page
  And I fill in "username" with 
    "AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  And I fill in "email" with "aaa@columbia.edu"
  And I fill in "password" with "abc"
  And  I press "Register"
  Then I should see "failure"
  Then I shoud be on the register page

Scenario: create bad email failure1
  Given I am on the register page
  And I fill in "username" with 
    "Alan"
  And I fill in "email" with "aaaaaaaacolumbia.edu"
  And I fill in "password" with "abc"
  And  I press "Register"
  Then I should see "failure"
  Then I shoud be on the register page

Scenario: create bad email failure2
  Given I am on the register page
  And I fill in "username" with 
    "Alan"
  And I fill in "email" with "aaaaaaaa@columbia.edu@columbia.edu"
  And I fill in "password" with "abc"
  And I press "Register"
  Then I should see "failure"
  Then I shoud be on the register page
  
Scenario: login success1
  Given I am on the login page
  And I fill in "username" with "Bill"
  And I fill in "password" with "mypassword"
  And I press "Login"
  Then I should see "success"
  Then I should be on the profile page for "Bill"
  
Scenario: login success2
  Given I am on the login page
  And I fill in "username" with "Alex"
  And I fill in "password" with "abc"
  And I press "Login"
  Then I should see "success"
  Then I should be on the profile page for "Alex"

Scenario: login failure
  Given I am on the login page
  And I fill in "username" with "Alex"
  And I fill in "password" with "aaaa"
  And I press "Login"
  Then I should see "failure"
  Then I should be on the login page

Scenario: check and update profile A
  Given I am on the profile page for "Alex"
  Then I should see "Alex"
  Then I should see "aaa@columbia.edu"
  Then I press "Update Profile"
  Then I should be on the updateprofile page for "Alex"
  Then I fill in "Address" with "1000 Broadway Ave."
  Then I click "Update Profile"
  Then I should be on the profile page for "Alex"
  Then I should see "1000 Broadway Ave."
  Then I should not see "333 Amsterdam Ave."
  Then I press "Update Profile"
  Then I should be on the updateprofile page for "Alex"
  Then I fill in "Address" with "333 Amsterdam Ave."
  Then I click "Update Profile"
  Then I should see "333 Amsterdam Ave."
  Then I should not see "1000 Broadway Ave."
  Then I should be on the profile page for "Alex"

Scenario: check and update profile B
  Given I am on the profile page for "Bill"
  Then I should see "Bill"
  Then I should see "bbb@columbia.edu"
  Then I press "Update Profile"
  Then I should be on the updateprofile page for "Bill"
  Then I fill in "Address" with "1000 Broadway Ave."
  Then I click "Update Profile"
  Then I should be on the profile page for "Bill"
  Then I should see "1000 Broadway Ave."
  Then I should not see "6000 W 120 St."
  Then I press "Update Profile"
  Then I should be on the updateprofile page for "Bill"
  Then I fill in "Address" with "4444 Amsterdam Ave."
  Then I click "Update Profile"
  Then I should see "4444 Amsterdam Ave."
  Then I should not see "1000 Broadway Ave."
  Then I should be on the profile page for "Bill"

Scenario: Logout A
  Given I am on the profile page for "Alex"
  And I press "Logout"
  Then I should be on the login page
  And I should not see "Alex"

Scenario: Logout B
  Given I am on the profile page for "Bill"
  And I press "Logout"
  Then I should be on the login page
  And I should not see "Bill"

Scenario: Login and register
  Given I am on the register page
  Then I press "Login"
  Then I should be on the login page
  Then I press "Register"
  Then I should be on the register page

