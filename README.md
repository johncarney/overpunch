# Overpunch

Simple module for parsing and formatting numbers in signed overpunch format.

[Signed overpunch](http://wikipedia.org/wiki/Signed_overpunch) is a code used
to indicate the sign of a number by replacing the last digit with a signed
overpunch code.

## Installation

Add this line to your application's Gemfile:

    gem 'overpunch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install overpunch

## Usage

    require "overpunch"

    Overpunch.parse("032B")
    # => 322

    Overpunch.parse("1}")
    # => -10

    Overpunch.format(110)
    # => "11{"

    Overpunch.format(-272)
    # => "27K"

    Overpunch.format(20, width: 6)
    # => "00002{"

## Contributing

1. Fork it ( http://github.com/johncarney/overpunch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
