# TypeConstraints

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
end

p TypeConstraints.check?(:Array, []) #=> true
p TypeConstraints.check?(:Array, {}) #=> false
p TypeConstraints.check?(:ArrayOfString, ["1000", "2000"]) #=> true
p TypeConstraints.check?(:ArrayOfString, [1000, 2000])     #=> false
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

1. Fork it ( https://github.com/[my-github-username]/type_constraints/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
