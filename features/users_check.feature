Feature: the user enters the LionSale app
  
  I want to check that the user can successfully register, log in and see the page.
  I also want to see and update my user profile in 
  
Scenario: create user success
  Given the following users not exist: 
    "Alex"
  And I am on the register page
  And I fill in "username" with "Alex"
  And I fill in "email" with "aaa@columbia.edu"
  And I fill in "password" with "abc"
  And I press "Register"
  Then I should see "success"
  Then I shoud be on the profile page for "Alex"

Scenario: create user failure
  Given the following users exist: 
    "Alex"
  And I am on the register page
  And I fill in "username" with "Alex"
  And I fill in "email" with "aaa@columbia.edu"
  And I fill in "password" with "abc"
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

Scenario: create bad email failure1
  Given I am on the register page
  And I fill in "username" with 
    "Alan"
  And I fill in "email" with "aaaaaaaa@columbia.edu@columbia.edu"
  And I fill in "password" with "abc"
  And I press "Register"
  Then I should see "failure"
  Then I shoud be on the register page
  
Scenario: login success
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

Scenario: check and update profile
  Given I am on the profile page for "Alex"
  Then I should see "Alex"
  Then I should see "aaa@columbia.edu"
  Then I press "Update Profile"
  Then I fill in "Address" with "1000 Broadway Ave."
  Then I click "Update Profile"
  Then I should see "1000 Broadway Ave."
  Then I press "Update Profile"
  Then I fill in "Address" with "333 Amsterdam Ave."
  Then I click "Update Profile"
  Then I should see "333 Amsterdam Ave."


