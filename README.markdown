# Cheezy's Watir Lab (Minus Watir) ((Plus Capybara))

This is a port of [Cheezy](http://twitter.com/chzy)'s recent [Watir](http://watir.com/) labs ([Blog](http://www.cheezyworld.com/2010/12/16/ui-tests-putting-it-all-together/), [Repo](https://github.com/cheezy/uitesting_blog)) to [Capybara](https://github.com/jnicklas/capybara).

## Getting Depot Running

To run the web tests, you'll need to first be running a local instance of the Depot application from the (pre-Rails 3 edition of the) [AWDWR book](http://pragprog.com/titles/rails3). Run this embarrasingly long command to download the Depot app and run it:

    curl http://media.pragprog.com/titles/rails3/code/rails3-code.tgz > code.tgz && tar xvf code.tgz && cd code/depot_t && mkdir log && touch log/devopment.log && rake db:migrate && script/server
    
From your browser, hit http://localhost:3000/store to verify that the app is running.

## Running these cucumber features

First, if you don't have it, you'll want to install [Bundler](http://gembundler.com/).

    gem install bundler
    
Now, to execute the feature, change into the directory containing this project and run:

    bundle install
    bundle exec cucumber
    
If all goes well, the feature's scenarios will all pass and you'll be able to dig into the code.
    
    