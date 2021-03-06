# Smolt

Smolt shows dependencies for homebrew.

## Installation

### Using gem command
    $ gem install smolt

### Using Bundler
Add this line to your application's Gemfile:

```ruby
gem 'smolt'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install smolt

## Usage
    $ smolt diff {formula}

This will show any additional dependent packages that need to be installed in order to install the package given in the argument.

If you don't need any additional packeges, Smolt returns the message like "{formula} does not require any additional dependencies."

Smolt returns "{formula} is not found.", when the formula specified as an argumant is not found in homebrew.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Naoyuk/smolt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Naoyuk/smolt/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Smolt project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Naoyuk/smolt/blob/main/CODE_OF_CONDUCT.md).
