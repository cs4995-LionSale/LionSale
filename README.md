# LionSale
CS W4995 S03 ESaaS Group Project

## Team Member
+ Weicheng Zhao (wz2578)
+ Yue Huang (yh3404)
+ Tianyi Wang (tw2774)
+ Ruohan Li (rl3227)

## Instruction to run and test locally

### To run
0. Clone our project
1. Install ruby version 3.0.2
2. At the root path of the project, run `bundle`
3. Run `yarn`
4. Run `rails db:migrate`
5. Put the `.env` file provided in the submission file into the root path of the project
6. Add the seed into the testing environment using 'db:seed'
7. Run `rails server` and the project would be available at `http://127.0.0.1:3000`

### To test

1. Refer the last section to setup database and input stuffs
2. Run cucumber --init for cucumber
3. Run rspec for rspec tests

## User stories
+ User could sign up and create an account.
+ User could not create an account with same email twice.
+ User could not create an account without email provided.
+ User could not create an account without username provided.
+ User could not create an account without password provided.
+ User could not create an account when providing different password and password confirmation.
+ User should see his uploaded avatar after he/she uploads it.
+ User can update their profile information.
+ User can delete their account. After deletion, this account cannot be accessed. 
+ Invalid profile (eg. invalid emails) updates are not accepted. 
+ There is an index page for items, sorted by creation time, so the user can check the available items for sale.
+ User can add item with valid information.
+ User cannot add item if information is invalid.
+ User can update existing item with valid information.
+ User cannot update existing item if information is invalid.
+ User cannot update other user's items. 
+ User can use the filter to see their own items. 
+ User can delete their own items. 
+ User cannot delete other users' items.
+ User can see the following statistics on their home page: items sold, items selling, items bought. 
+ User can create transactions for the items they want to buy. 
+ Transactions can proceed with layers of buyer/seller confirmation.
+ Transactions will not succeed if buyer/seller are too far from each other.
+ Transactions can be cancelled by buyer/seller. 
+ User can check their transaction records any time. 
+ User can send messages to other users regarding the products.
+ User can check their messages any time in the inbox. 

Please refer `./features` directory for details

## Links
+ Heroku deployment link: https://lion-sale.herokuapp.com/
+ Github repo link: https://github.com/cs4995-LionSale/LionSale

## Notes
We have added Recaptcha for security reasons, but we are not covering them in our tests because it will be ignored and thus cannot be tested in cucumber. We also didn't test the "remember me" function, because it requires closing and reopening the browser, which is not covered by cucumber. 

Note that our cucumber seed has checkin location inside columbia university. To ensure the validity of our transactions, requests are only approved when the users are within 1km of each other. So please note theat the cucumber tests for transactions will only pass when the testing is conducted within/close to Columbia campus. 