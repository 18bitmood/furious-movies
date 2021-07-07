# README
This is the app which made as a test task. A complete description of the task is here:
https://gist.github.com/swistaczek/0fa028af47eb83d19b5da3e6d3092e63

Shortly, this is an API which is using to manage movies in a small cinema,
which is specialized only in Fast and Furious series.

This app allows to add movies, set prices and showtimes, add ratings
and set up fetching details about every movie from OMDB API.

Please note that there are no auth or managing abilities for users, it's a demo app.

## SETUP

To setup an application:

1. Download this repo to your local machine
2. Copy '.env.example' file as '.env' and add an APIkey for OMDB
3. Run 'bundle install' in a folder
4. Run "rails db:setup" - it also should include seeds to the app
5. Start an application with 'rails s' command
6. Enjoy

## USAGE

If you add seeds to your application ('rails db:setup'), it should be data in it.
It provides all Fast and Furious series movies, and randomly adds showtimes, ratings, and prices for each of them.

## You can find a documentation if you go to 'http://localhost:3000/api/docs/v2/docs.html' when the app is running


<i>Note that all lists are paginated with 10 per page, to get the second page of every list, add page=2 to request.</i>

Here is the short instruction of usage.

## /movies

Every movie has its name, imdb_id, price, related ratings and showtimes.

Get /movies - returns you a list of movies.

Get /movies/:id - returns you a movie.

Get /movies/:id/details - returns you a movie with a description from OMDB API.

Get /all_movies - returns you a list of movies with descriptions from OMDB API.

Post /movies - add a new movie.

Patch /movies/:id - update existing movie.

Delete /movies/:id - destroy a movie.

Post /update_all_prices - change the price for every movie to the value from params: price=.
Note that you still can update a price to a movie personally by using patch /movies/:id.
## movies/:id/ratings

Ratings related to the movie.
You can post as many ratings as you wish, it will add them and count the total number of ratings for the movie and an average rating. You can get this info from /movies/:id.

Post movies/:id/ratings - add a new rating to the movie

Get movies/:id/ratings - get you the list of ratings

## movies/:id/showtimes

Showtimes related to the movie.

Post movies/:id/showtimes - creates a new showtime

Get movies/:id/showtimes/:id - shows you existing showtime

Patch movies/:id/showtimes/:id - updates existing showtime

Delete movies/:id/showtimes/:id - deletes an existing showitme

Get movies/:id/showtimes - show you the list of showtimes relates to the movie.
NOTE! SHOWS YOU ONLY FUTURE SHOWTIMES. TO SEE ALL SHOWTIMES FOR THE MOVIE, ADD 'including=all' PARAM TO YOUR REQUEST.
