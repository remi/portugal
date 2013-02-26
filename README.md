# Portugal

Use ActiveRecord migrations, but not in Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'portugal'
```

And then execute:

```shell
$ bundle install
```

## Usage

In your `Rakefile`:

```ruby
require 'portugal/tasks'
Portugal.configure do |config|
  config.migrations_path = File.expand_path("../config/migrations", __FILE__)
end

# This task is called before Portugal executes its tasks.
# It should require ActiveRecord somehow and establish the database connection
#
# Change it so it works for your application
task :environment do
  require 'bundler'
  Bundle.require
  ActiveRecord::Base.establish_connection({})
end
```

Then, in your shell:

```shell
$ bundle exec rake -T | grep 'db:'
rake db:migrate        # Migrate the database
rake db:new_migration  # Create a new migration file (specify name w/ NAME=do_something)
rake db:rollback       # Rolls the database back to the previous version (specify steps w/ STEP=n).
```

Yay!
