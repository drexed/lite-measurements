# Lite::Measurements

[![Gem Version](https://badge.fury.io/rb/lite-measurements.svg)](http://badge.fury.io/rb/lite-measurements)
[![Build Status](https://travis-ci.org/drexed/lite-measurements.svg?branch=master)](https://travis-ci.org/drexed/lite-measurements)

Lite::Measurements is a library for converting measurements to different unit sizes or types.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-measurements'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-measurements

## Table of Contents

* [Configurations](#configurations)
* [Monkey-patches](#monkey-patches)
* [Temperature](#temperature)

## Configurations

`rails g lite:measurements:install` will generate the following file:
`../config/initalizers/lite-measurements.rb`

```ruby
Lite::Measurements.configure do |config|
  config.monkey_patches = true
end
```

## Monkey-patches

Including a measurements monkey patches will give you numeric access to conversions.

```ruby
2.convert_temperature(from: :fahrenheit, to: :celsius) #=> -16.666666666666668
```

## Temperature

Option | Type | Default
--- | --- | ---
from, to | symbol | `:celsius`, `:fahrenheit`, `:kelvin`

```ruby
temperature = Lite::Measurements::Temperature.new(2)
temperature = temperature.convert(from: :fahrenheit, to: :celsius)      #=> -16.666666666666668

# - or -

Lite::Measurements::Temperature.convert(2, from: :celsius, to: :kelvin) #=> 275.15

# - or -

2.convert_temperature(from: :kelvin, to: :fahrenheit)                   #=> -456.07
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-measurements. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Measurements project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-measurements/blob/master/CODE_OF_CONDUCT.md).
