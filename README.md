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
* [Measurements](#measurements)
* [Monkey patches](#monkey-patches)

## Configurations

Any and all monkey patches must be explicitly included anywhere you want to use it.

To globally use the monkey patches, just create an initializer requiring them.

`rails g lite:measurements:install` will generate the following file:
`../config/initalizers/lite_measurements.rb`

They can be disabled by commenting any of them out.

```ruby
# frozen_string_literal: true

require 'lite/measurements/monkey_patches'

# - or-

# require 'lite/measurements/monkey_patches/digital_storage'
# require 'lite/measurements/monkey_patches/length'
# require 'lite/measurements/monkey_patches/mass'
# require 'lite/measurements/monkey_patches/temperature'
# require 'lite/measurements/monkey_patches/time'
```

## Measurements

* [Digital Storage](https://github.com/drexed/lite-measurements/blob/master/docs/DIGITAL_STORAGE.md)
* [Length](https://github.com/drexed/lite-measurements/blob/master/docs/LENGTH.md)
* [Mass](https://github.com/drexed/lite-measurements/blob/master/docs/MASS.md)
* [Temperature](https://github.com/drexed/lite-measurements/blob/master/docs/TEMPERATURE.md)
* [Time](https://github.com/drexed/lite-measurements/blob/master/docs/TIME.md)

## Monkey patches

Including monkey patches will give you `Numeric` access to conversions.

```ruby
2.convert_temperature(from: :fahrenheit, to: :celsius) #=> -16.666666666666668
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
