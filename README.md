# Let Us Lunch

Let Us Lunch is a simple Rails app for scheduling lunch meetings via email. It is designed to be
as fast and frictionless as possible.

## Installation

    bundle install
    rake db:create
    rake db:migrate
    foreman start
    
Development was designed to work with [Mailcatcher](http://mailcatcher.me) though you'll have to
adjust the default host and port settings in `development.rb` first.

## License

This code is Copyright 2013 Michael Bleigh. May only be used with permission.