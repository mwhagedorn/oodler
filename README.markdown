# Oodler

Ruby wrapper for the [Oodle API](http://developer.oodle.com). Heavily inspired by [Wynn Nederlands's](http://github.com/pengwynn) [LinkedIn gem](http://github.com/pengwynn/linkedin), the Oodler gem provides an easy-to-use wrapper for Oodles's XML APIs.

## Installation

    sudo gem install gemcutter
    gem tumble
    sudo gem install oodler
    
## Usage

### Authenticate

Ooodle's API uses  a key for authentication, you can get a key at http://developer.oodle.com/request-api-key/

    require 'rubygems'
    require 'oodler'

    # get your api keys at https://www.linkedin.com/secure/developer
    client = Oodler::Client.new("YOURAPIKEY")

### Listing examples

    # get the profile for the authenticated user
    result = client.listing({:region => "chicago",:category => "vehicle/car"})

    puts result.listings[0].id
    puts result.listings[0].title
    puts result.listings[0].id
    puts result.listings[0].body
    puts result.listings[0].url
    puts result.listings[0].images[0].src

    ..etc


    


 TODO

* Nothing yet

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 [Mike Hagedorn](http://silverchairsolutions.com). See LICENSE for details.
