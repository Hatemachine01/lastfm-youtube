# LastFM - Youtube Player

Web app to play Youtube videos of your lastfm's favorited tracks. The app utilizes LastFM's, Youtube and Spotify's API to provide the user with videos of their library.



Technologies:

- Ruby on Rails
- Javascript/jQuery/Ajax
- Bootstrap
- Rspec/Capybara


Ruby Gems :


-  Nokogiri
-  Kaminari
-  Selenium-webdriver
-  Geckodriver-helper
-  Gritter"
-  Social-share-button
-  font-awesome-rails
-  Rubocop
-  Newrelic_rpm
-  Rspotify
-  Popper_js
-  figaro


##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.4.0]
- Rails [5.0.2]

##### 1. Check out the repository

```bash
git clone https://github.com/Hatemachine01/lastfm-youtube.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

