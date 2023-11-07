# README

Howdy, my name is David Husa and this is my takehome evaluation for Placements.io.

I elected to create my own application from scratch as the example boilerplate application was out of date and wouldn't build without further troubleshooting, so this uses the currently most up-to-date Ruby on Rails version of 7.1.1 with Ruby 3.2.2.  I elected to stick to the Hotwire front-end paradigm now favored by Rails' defaults.

Run the following commands to install and run the application:
1) Ensure you're using Ruby 3.2.2 in the project folder. (This should work automatically if you use rbenv and have installed 3.2.2 with `rbenv install 3.2.2`)

2) Install the gems
* bundle install

3) Set up the database and seed with data
* rails db:migrate
* rails db:seed

4) Run the test suite
* rails test

5) Run the server
* rails server