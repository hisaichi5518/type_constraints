# TypeConstraints

[![Build Status](https://travis-ci.org/hisaichi5518/type_constraints.svg?branch=master)](https://travis-ci.org/hisaichi5518/type_constraints)

## Usage

```ruby
require "type_constraints"

TypeConstraints.setup do
  type :Array do
    constraint -> v { v.kind_of?(Array) }
  end
  subtype :ArrayOfString, :Array do
    constraint -> v { v.all?() {|v| v.kind_of?(String) } }
  end
  subtype :ArrayOfHisa, :ArrayOfString do
    constraint -> v { v.all?() {|v| v === "5518" } }
  end
end


puts "testing Array"
p TypeConstraints.check?(:Array, []) #=> true
p TypeConstraints.check?(:Array, {}) #=> false

puts "testing ArrayOfString"
p TypeConstraints.check?(:ArrayOfString, ["1000", "2000"]) #=> true
p TypeConstraints.check?(:ArrayOfString, [1000, 2000])     #=> false
p TypeConstraints.check?(:ArrayOfString, {})               #=> false

puts "testing ArrayOfHisa"
p TypeConstraints.check?(:ArrayOfHisa, ["5518"]) #=> true
p TypeConstraints.check?(:ArrayOfHisa, ["hisa"]) #=> false
p TypeConstraints.check?(:ArrayOfHisa, [5518])   #=> false
```

## Default Type Constrains

```ruby
BasicObject
  Object
    Hash
    Array
    Method
    UnboundMethod
    String
    Symbol
    Range
    Exception
    NilClass
    TrueClass
    FalseClass
    Regexp
    Time
    MatchData
    Proc
    Module
      Class
    Numeric
      Float
      Integer
        Bignum
        Fixnum
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'type_constraints'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install type_constraints

## Contributing

1. Fork it ( https://github.com/hisaichi5518/type_constraints/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
