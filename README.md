# Overpunch

[![Gem Version](https://badge.fury.io/rb/overpunch.svg)](http://badge.fury.io/rb/overpunch)
[![Build status](https://travis-ci.org/johncarney/overpunch.svg?branch=master)](https://travis-ci.org/johncarney/overpunch)
[![Coverage Status](https://img.shields.io/coveralls/johncarney/overpunch.svg)](https://coveralls.io/r/johncarney/overpunch?branch=master)

Simple module for parsing and formatting numbers in signed overpunch format.

[Signed overpunch](http://wikipedia.org/wiki/Signed_overpunch) is a code used
to indicate the sign of a number by replacing the last digit with a signed
overpunch code. For example, -45 would be encoded as "4N".

| Sign | Digit | Code |
|:----:|:-----:|:----:|
|    + |     0 |    { |
|    + |     1 |    A |
|    + |     2 |    B |
|    + |     3 |    C |
|    + |     4 |    D |
|    + |     5 |    E |
|    + |     6 |    F |
|    + |     7 |    G |
|    + |     8 |    H |
|    + |     9 |    I |
|    - |     0 |    } |
|    - |     1 |    J |
|    - |     2 |    K |
|    - |     3 |    L |
|    - |     4 |    M |
|    - |     5 |    N |
|    - |     6 |    O |
|    - |     7 |    P |
|    - |     8 |    Q |
|    - |     9 |    R |

## Installation

Add this line to your application's Gemfile:

    gem "overpunch"

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

## Requirements

* Ruby 2.0.0 or later

## Contributing

1. Fork it ( http://github.com/johncarney/overpunch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
