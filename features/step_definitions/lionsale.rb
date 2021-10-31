Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
      Users.create user
    end
  end
  