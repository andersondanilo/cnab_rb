# CnabRb

Project to create and read CNAB files

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cnab_rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cnab_rb

## Usage

Read return files:

```ruby
require 'cnab_rb'

factory = CnabRb::Return::ReturnFactory.new
file = factory.make_return('path/to/file.ret')

file.details.each do |detail|
  received_amount = detail.net_amount
  is_write_off = detail.is_write_off
  our_number = detail.our_number
  
  if is_write_off && received_amount > 0
    # your title is paid
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cnab_rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
