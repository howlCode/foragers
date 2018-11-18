# Foragers

## What is it?

A Rails 5 app that explores mushroom hunting and wild foraging. A user may contribute to the database by adding information about individual mushrooms that they find in the wild.
A user may also purchase products from the store, and sign up for courses that the site-owner leads.

## Why did you make it?

At the time I started thinking about creating this app, the wild foraging community seemed pretty scattered. I couldn't seem to find a good centralized source of information and place to ask questions or meet people. This app is my opportunity to solve that problem.

## How can I use it?

-Clone the repo, cd into the directory and run bundle install.
-You'll need to set up Postgresql on your machine, I recommend following this tutorial(linux): https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04
-Update config/database.yml with your user and password for postgres
-run commands 'rails db:create' and 'rails db:migrate'
-run comman 'rails server' and point your browser to 'localhost:3000'

## TODO

\*This now features a full React/Redux frontend that is currently being integrated, with a scheduled release of 11/2018.

\*Extend the mushroom database to include other wild foraging items, plants/trees.
