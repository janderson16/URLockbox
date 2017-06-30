# URLockBox

## About the app

The URLockbox is an app for tracking your favorite links. Users must create an account using their email address and a password in order to keep track of their links. Once signed in, users must enter a valid URL (https://www.google.com rather than google.com) and a user-chosen title (cannot be blank) to save. Links have an 'unread' status by default but can be changed using the 'Mark as Read/Mark as Unread' buttons. Users can filter their links in one of two ways. The first is to enter text into the filter box, as a user types, their results list will shorten with each key typed. The second is to click on the "Only Read Links" or "Only Unread Links" buttons which limit results to the read status of each link.

[Production link](https://obscure-basin-69091.herokuapp.com/)

This app also works in conjunction with [HotReads](https://peaceful-anchorage-24168.herokuapp.com/) to track the most read links.

#### The Nitty Gritty
* Ruby 2.3.0
* Rails 5.0.0.1
* RSpec test suite w/ Selenium & Capybara
* BCrpyt


## Setup

1. Clone down the repository
```$ git clone git@github.com:janderson16/m4-final.git```
1. Bundle
```$ bundle install```
1. Create database
```$ rake db:create```
1. Migrate
```$ rake db:migrate``` 
1. Seed
```$ rake db:seed```
#### Run Locally
1. Start server
```$ rails s```
1. visit localhost in broswer
```localhost:3000``` 
2. **if trying to serve with HotReads (both locally)  - in ```read.js``` it's important to comment out line 22 and un-comment line 21 to change the AJAX call destination**
#### Run Test Suite
* Must have Firefox 46  [here](https://www.softexia.com/windows/web-browsers/firefox-46) in order to run Selenium webdriver (JavaScript tests)
```$ rspec```
* SimpleCov coverage
```$ open coverage/index.html```
* 27 examples, 0 failures (98.62% coverage)

---
