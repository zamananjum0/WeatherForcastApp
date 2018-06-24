# WeatherApp - Genome Coding Challenge

[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/jalerson/weatherapp) [![Codeship Status for jalerson/weatherapp](https://app.codeship.com/projects/66cef6a0-51df-0135-774f-3acbe865a34f/status?branch=master)](https://app.codeship.com/projects/234525)

## Challenge specs

In this coding challenge you are going to write a simple weather app to display the current weather in a given location to the user.

Use the Open Weather Map JSON API (http://openweathermap.org/API) to get real weather data.

Your app should:

Overview You’ll write a simple weather application to show the current weather in a given location.

We recommend using the Open Weather Map JSON API (http://openweathermap.org/API) to get real weather data.
What should the application do?
1. Display the weather information for any given city
2. Cache the fetched weather data (optional)
3. Manage the cases where the weather’s information for a given city can’t be found


What should I do?
1. Create a new Rails project. In our day to day work we use Rails API projects.
2. Implement the project with following best practices and widely accepted standards.
    We value the following:
    a. Tests (Unit tests, requests specs)
    b. Code that follows code guidelines
    c. Understandable structure
    d. Code that make usage of Object Oriented Design
3. Create a README.md in the root of the project and provide a project overview. Would be great if you can point out
    what you could you improve in the project. 4. Push your code to a public repository on (GitHub, GitLab, BitBucket)
    or any other repository. If you don’t have one, please create it.


## My app

My app is based on Rails 5.2.0, Ruby 2.5.1.

Demo:

### Front-end

- [Weather Icons](https://erikflowers.github.io/weather-icons/)
- [Google Fonts](https://fonts.google.com/)
- [Animate](https://daneden.github.io/animate.css/)

### Back-end

- [Geokit](https://github.com/geokit/geokit): to locate the user based on the IP address
- [Rest-client](https://github.com/rest-client/rest-client): to fetch weather data from the OpenWeatherMap API. I could use a gem to get this information, however, the challenge specs state that my app should use the API.
- [Google Places](https://github.com/qpowell/google_places): the Google Places API have been used to get the location lat/lng when the user provides a city name on the search field.

### Testing
- RSpec/Capybara
- [Rubocop](https://github.com/bbatsov/rubocop)


