# Given /the following user exist/ do |users_table|
#     users_table.hashes.each do |usern|
#       User.create usern
#     end
#   end
# Given /the following user do not exist/ do |users_table|
#     users_table.hashes.each do |usern|
#       User.delete usern
#     end
#   end


Given /^I have signed up as "([^"]*)"$/ do |email|
  visit(signup_path)
  fill_in('user_email', :with => email)
  fill_in('user_username', :with => "alex")
  fill_in('user_password', :with => 's3caaar3t')
  fill_in('user_password_confirmation', :with => 's3caaar3t')
  fill_in('user_address', :with => '100 100st.')
  click_button('signupbutton')
end

Given /^I have signed up long as "([^"]*)"$/ do |email|
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
  fill_in('password', :with => 's3caaar3t')
  click_button('loginbutton')
end

Then /^I should be on the home (.*)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == users_path()
  else
    assert_equal users_path(), current_path
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

Then /^I should be on the login (.*)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == signup_path()
  else
    assert_equal signup_path(), current_path
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