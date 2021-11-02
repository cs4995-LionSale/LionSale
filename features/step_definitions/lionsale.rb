Given /the following user exist/ do |users_table|
    users_table.hashes.each do |usern|
      User.create usern
    end
  end
Given /the following user do not exist/ do |users_table|
    users_table.hashes.each do |usern|
      User.delete usern
    end
  end