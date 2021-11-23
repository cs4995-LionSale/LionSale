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

  click_button('Logout')

end

Then /^I go to update profile$/ do 
  click_link('Edit my Profile')
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

Given /^I am on the register page$/ do
  visit(signup_path)
end

Then /^I go to signup$/ do 
  click_link('Signup',:match => :first)
end

Then /^I go to login$/ do 
  click_link("Login")
end

Then /^I delete user$/ do
  
  click_button("Delete This Account")
  # page.save_and_open_screenshot()

  # page.driver.browser.switch_to.alert.accept
end






Then /^I edit item$/ do
  click_button("Edit it!")
end

Then /^I update item$/ do
  click_link('Detail', :match=>:first)
  click_link("Edit this item")
end

Then /^I delete item$/ do
  click_link('Detail', :match=>:first)
  click_button("Close selling")
end

Then /^I goto update item$/ do
  page.find('#nav-dropdown').click
  click_link("My Items")
end

Then /^I goto items page$/ do
  click_link("Items")
end

Then /^I goto categories page$/ do
  click_link("Categories")
end

Then /^I goto (.*) category$/ do |text|
  click_link(text)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.has_content?(text).should eq true
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.save_and_open_screenshot()
  page.has_content?(text).should eq false
end

Then /^I sell item$/ do 
  page.find('#nav-dropdown').click
  click_link('Sell an item')
  
end
  
Then /^I putin itemtitle (.*)$/ do |text|
  fill_in('item_title', :with => text)
end

Then /^I putin itemprice (.*)$/ do |text|
  fill_in('item_price', :with => text)
end

Then /^I putin itemcat (.*)$/ do |text|
  select(text, :from => 'item_category_id')
end

Then /^I putin itemquant (.*)$/ do |text|
  fill_in('item_stock', :with => text)
end

Then /^I sell it$/ do
  click_button("Sell it!")
end

Then /^I should be on the home page for (.*)$/ do |name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should 
    current_path.should == user_path(6)
  else
    assert_equal users_path(Users.all.select{ |u| u.username == name }), current_path
  end
end

Then /^I should be on the new item (.*)$/ do |name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should 
    current_path.should == '/items/new'
  else
    assert_equal users_path(Users.all.select{ |u| u.username == name }), current_path
  end
end

Then /^I should be on the second home page for (.*)$/ do |name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should 
    current_path.should == user_path(7)
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
    current_path.should == '/'
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