# The Zaim Ruby Gem

A Ruby interface to the Zaim API.

## Installation

Add this line to your application's Gemfile:

    gem 'zaim-ruby'

And then execute:

    $ bundle install --path vendor/bundle

Or install it yourself as:

    $ gem install zaim-ruby

## Quick Start Guide

**Register your application with [Zaim Developers Center][Zaim].**

```ruby
Zaim.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
end
```

[Zaim]: https://dev.zaim.net/

**Instantiate a Zaim::Client for each user's access**

```ruby
client = Zaim::Client.new(
  oauth_token: "Client's access token",
  oauth_token_secret: "Client's access secret"
)
```

**You can make requests as the authenticated user**

```ruby
client.user_verify
```

## Usage Examples

**Initialize**

```ruby
Zaim.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
end

client = Zaim::Client.new(
  oauth_token: YOUR_OAUTH_TOKEN,
  oauth_token_secret: YOUR_OAUTH_SECRET
)
```

**Fetch the requesting user's information**

```ruby
client.user_verify # => alias: current_user
```

**Fetch the list of input money data**

```ruby
client.money_get # => alias: money
```


**Fetch the list of requesting user's categories**

```ruby
client.category_home_get # => alias: categories
```

**Fetch the list of system default categories**

```ruby
client.category_get # => alias: default_categories
```

**Fetch the list of requesting user's genres**

```ruby
client.genre_home_get # => alias: genres
```

**Fetch the list of system default genres**

```ruby
client.genre_get # => alias: default_genres
```

**Fetch the list of requesting user's accounts**

```ruby
client.account_home_get # => alias: accounts
```

**Fetch the list of system default accounts**

```ruby
client.account_get # => alias: default_accounts
```

**Fetch the list of available currencies**

```ruby
client.currency_get # => alias: currencies
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
