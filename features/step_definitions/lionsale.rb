Given /^I have filled info and signed up as "([^"]*)"$/ do |email|
  visit(signup_path)
  fill_in('user_email', :with => email)
  fill_in('user_username', :with => "alex")
  fill_in('user_password', :with => 's3caaar3t')
  fill_in('user_password_confirmation', :with => 's3caaar3t')
  fill_in('user_address', :with => '100 100st.')
  click_button('signupbutton')
end

Given /^I have filled info and signed up long as "([^"]*)"$/ do |email|
  visit(signup_path)
  fill_in('user_email', :with => email)
  fill_in('user_username', :with => "AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
     AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
     AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  fill_in('user_password', :with => 's3caaar3t')
  fill_in('user_password_confirmation', :with => 's3caaar3t')
  fill_in('user_address', :with => '100 100st.')
  click_button('signupbutton')
end

Given /^I have login as "([^"]*)"$/ do |email|
  visit(login_path)
  fill_in('email', :with => email)
  fill_in(placeholder:'Your Password', :with => 's3caaar3t')
  click_button('loginbutton')
end

Then /^I logout$/ do
  page.find('#nav-dropdown').click
  click_link('nav-logout-link')
end

Then /^I go to update profile$/ do 
  click_link('Edit My Profile')
end

Then /^I update$/ do 
  click_button('Edit my Profile')
end

Then /^I put in new email as "([^"]*)"$/ do |email|
  fill_in('user_email', :with => email)
end

Then /^I put in new address as "([^"]*)"$/ do |address|
  fill_in('user_address', :with => address)
end

Then /^I put in new name as "([^"]*)"$/ do |name|
  fill_in('user_username', :with => name)
end

Then /^I should be on the home page for (.*)$/ do |name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should 
    current_path.should == user_path(1)
  else
    assert_equal users_path(Users.all.select{ |u| u.username == name }), current_path
  end
end

Then /^I should be on the register (.*)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == signup_path()
  else
    assert_equal signup_path(), current_path
  end
end

Then /^I should be on the slash (.*)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should =='/'
  else
    assert_equal '/', current_path
  end
end

Then /^I should be on the login (.*)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == login_path()
  else
    assert_equal login_path(), current_path
  end
end

Then /^I should be on the logout (.*)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == logout_path()
  else
    assert_equal logout_path(), current_path
  end
end

Then /^I should be on the profile (.*)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == about_path()
  else
    assert_equal about_path(), current_path
  end
end