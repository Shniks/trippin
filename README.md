# Trippin

![this](/screenshots/landing.png)

**Trippin** is an app that allows users to search for National Parks within a certain radius of an entered location. Users enter the app via ```Google OAuth```, enter a location in the search fields, specify a search radius and hit ```Submit```. They are then taken to a parks index page that shows all the National Parks within their search radius. The list of parks can be viewed either in a map or list format. Users can select a park (either from the list view or by clicking on the url from the popup info window in the map) and are taken to the park's show page where they see some park information along with photos for that park by way of the Flickr API.

## Table of Contents
[Heroku Deployment](#heroku-deployment)  
[Prerequisites](#prerequisites)  
[Installation Instructions](#installation-instructions)  
[APIs Used](#apis-used)  
[Testing](#testing)  
[Additional Screenshots](#additional-screenshots)  
[Author](#author)

### Heroku deployment

The project is hosted on [Heroku](https://nps-search.herokuapp.com/). Please note that your browser must support SSL encryption (HTTPS) for Google OAuth to function. As such Chrome is recommended when trying out this app on Heroku. Or simply click on, or copy and paste this url, into your browser: https://nps-search.herokuapp.com/

### Prerequisites

```
Ruby Version 2.4 or higher
Rails Version 5 or higher
Postgresql
```

### Installation Instructions

Clone this repository into your machine using the following command:
```ruby
git clone git@github.com:Shniks/trippin.git
```

Switch into the directory ```trippin``` and run bundle as follows:
```ruby
bundle
```

Setup the database by running the following commands:
```ruby
rake db:create db:migrate
rake import:all
```

To view the app on localhost, start the server by entering the following command in your terminal:
```ruby
rails s
```

Open up a browser window and then enter the app by clicking on ```Sign in With Google```.
### APIs used


The app makes use of the following APIs:

- National Parks API
- Google Geocoding API
- Google+ API
- Maps Javascript API
- Flickr API

In order to use the app, create an ```application.yml``` file and enter API keys for the above (you might need to register to get these keys). You would also need to register for Google OAuth to allow users to log in via google.

### Testing

This app has a 100% test coverage (as determined by [SimpleCov](https://github.com/colszowka/simplecov)) using the [RSpec](https://github.com/rspec/rspec-rails) testing framework. The app utilizes various gems including [Factory Bot](https://github.com/thoughtbot/factory_bot), [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) and [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers).

Testing can be initiated by entering the following command in your terminal:
```ruby
rspec
```

### Additional Screenshots

**Search Page**

![this](/screenshots/search.png)

**Parks Index**

![this](/screenshots/parks_index.png)

**Park Show**

![this](/screenshots/park_show.png)

### Author

[Nikhil Shahi](https://github.com/Shniks)
