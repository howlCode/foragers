# Shroom Hunters!

Full-stack web app running on Ruby on Rails 5.1.4. Allows users to view/add an extensive mushroom database that shows common mushrooms with a name, genus family, description, image, and whether it is edible or not.
Also, a full e-commerce platform allows users to purchase site-branded clothing and tools for wild foraging and mushroom hunting.
Fake courses are offered in the education section. Email-confirmations are sent out on sign-up.

live here: http://shroom-hunters.howlcode.com 

You will need additional gems if you clone the site:
-Devise (for user authentication)
-Paperclip (image attachments)
-Bulma-rails (uses bulma.io for the CSS framework)
-PG (uses a postgres database)

run:
bundle install
rails db:create
rails db:migrate
rails server


