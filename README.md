# Book-shop
How To Run Book-shop In Terminal
cd Book-shop-master - this will enter the root folder of the project
cd db - this will enter into the db folder
createdb shop - this creates an SQL database
psql -d shop -f shop.sql - this runs the shop.sql file creating the tables
cd .. - this will return you back to the root folder
ruby console.rb - this will populate the tables in the database
ruby controller.rb - this will start up the webpage
In a browser go to ('localhost:4567') to enter the webpage
