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

Then /^I should be on the transactions page$/ do 
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should 
    current_path.should == '/transactions'
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

Then /^I should be on the third home page for (.*)$/ do |name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should 
    current_path.should == user_path(8)
  else
    assert_equal users_path(Users.all.select{ |u| u.username == name }), current_path
  end
end

Then /^I should be on the fourth home page for (.*)$/ do |name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should 
    current_path.should == user_path(9)
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

Then /^I should be on the items (.*)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == '/items'
  else
    assert_equal about_path(), current_path
  end
end

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
  accept_confirm do
    click_button("Delete this Account")
  end
end

Then /^I edit item$/ do
  click_button("Sell it!")
end

Then /^I update item$/ do
  click_link('Detail', :match=>:first)
  click_link("Edit this Item")
end

Then /^I delete item$/ do
  click_link('Detail', :match=>:first)
  accept_confirm do
    click_button("Close Selling")
  end
end

Then /^I goto update item$/ do
  page.find('#nav-dropdown').click
  click_link("My Items")
end

Then /^I goto my transactions$/ do
  page.find('#nav-dropdown').click
  sleep 1
  Capybara.ignore_hidden_elements = false
  find("#nav-transaction-link").click
  Capybara.ignore_hidden_elements = true
  
end

Then /^I goto items page$/ do
  click_link("Items")
  sleep 1
end

Then /^I goto categories page$/ do
  click_link("Categories")
end

Then /^I go to (.*) category$/ do |text|
  click_link(text)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.has_content?(text).should eq true
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.has_content?(text).should eq false
end

Then /^I do geolocation$/ do
  # page
  # .driver
  # .browser
  # .execute_cdp(
  #   'Page.setGeolocationOverride',
  #   accuracy: 100,
  #   latitude: latitude.to_f,
  #   longitude: longitude.to_f
  # )
  # page.execute_script "navigator.geolocation.getCurrentPosition = function(success) { success({coords: {latitude: 50.455755, longitude: 30.511565}}); }"
end

Then /^I sleep$/ do
  sleep 1
end

Then /^I screenshot$/ do
  page.save_and_open_screenshot
end

Then /^I sell item$/ do 
  page.find('#nav-dropdown').click
  click_link('Sell an Item')
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

Then /^I buy item$/ do
  click_link('Detail', :match=>:first)
  click_link("Request to Buy")
  click_button("Buy Now!")
end

Then /^I check details$/ do
  click_link("Details", :match=>:first) 
end

Then /^I cancel transaction$/ do
  accept_confirm do
  click_button("Cancel Purchase Request")
  end
end

Then /^I confirm transaction$/ do
  accept_confirm do
  click_button("Approve Purchase Request")
  end  
end

Then /^I confirm deal$/ do
  accept_confirm do
  click_button("Confirm Deal")
  sleep 1
  end
  sleep 10

  # print(page.driver.browser.manage.logs.get(:browser).to_s)
end

Then /^I write message (.*)$/ do |text|
  click_link("Contact", :match => :first)
  fill_in('messagebox', :with => text)
end

Then /^I send message$/ do
  click_button("Send!")
end

Then /^I check my messages$/ do
  page.find('#nav-dropdown').click
  sleep 1
  Capybara.ignore_hidden_elements = false
  find("#nav-mailbox-link").click
  Capybara.ignore_hidden_elements = true
  # page.find( 'div.card msg-card').click
  page.find('#msg-card-3').click
end


# Capybara.register_driver :selenium-webdriver do |app|      
#   profile = Selenium::WebDriver::Chrome::Profile.new
#   profile['geolocation.default_content_setting'] = 1
#   config = { :browser => :chrome, :profile => profile }    
#   Capybara::Selenium::Driver.new(app, config)
# end