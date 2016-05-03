# NbaScoreboard

This Ruby Gem provides a very basic CLI to view as default the last most recent complete day of NBA games and scores

For example, if games are currently being played, the scoreboard will return zero games played today until basketball-reference.com updates the final score. If the season is over, obviously, there will be zero games played for that day. 

An update will later be provided to the CLI to incorporate full box scores with game and player stats, as well as, betting lines and in-game props.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nba_scoreboard'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nba_scoreboard

## Usage

When the nba scoreboard gem is run, the list of the day's games will be printed. By inputting the game number in which it appears on the list, the score of the game will be provided. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nba_scoreboard. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

