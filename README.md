# EasyEnum

Turn any Ruby class in an easy to use enum.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_enum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_enum

## Basic Usage

```ruby
include EasyEnum

class Color < EasyEnum
  easy_enum(green: 0, red: 1, blue: 2)
end

# or

class Color < EasyEnum
  self.easy_enum = {
    green: 0,
    red: 1,
    blue: 2
  }
end

```

### Getting an Instance

```ruby
Color.green
Color.red
Color.blue

Color.new(0)
Color.new(1)
Color.new(2)

Color.key(:green)
Color.key(:red)
Color.key(:blue)

Color.value(0)
Color.value(1)
Color.value(2)

```

### Getting Values

```ruby
green = Color.green
green.value
# => 0

red = Color.red
red.value
# => 1

blue = Color.blue
blue.value
# => 2

```

### Check the value of your instance

```ruby
color = Color.green

color.green? # => true
color.red? # => false
color.blue? # => false

```

### Exploring the Enum

```ruby
Color.members
# => {:green=>0, :red=>1, :blue=>2}

Color.keys
# => [:green, :red, :blue]

Color.values
# => [0, 1, 2]

Color.key?(:green)
# => true

Color.value?(0)
# => true

```


### Comparison

```ruby
green = Color.green

green == :green # => true
green == 0 # => true
green == Color.green # => true
green == Color.key(:green) # => true
green == Color.value(0) # => true

green == Color.red # => false

```


### Redefining the value of your instance

```ruby
color = Color.green
color.value # => 0
color.key # => :green

color.value = 1
color.value # => 1
color.key # => :red

color.key = :blue
color.value  # => 2
color.key # => :blue

color.key = :yellow
# => raises EasyEnum::KeyNotInEnum

color.value = 3
# => raises EasyEnum::ValueNotInEnum

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcoroth/easy_enum.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
