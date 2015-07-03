# Capistrano 3 Env Management

Small Capistrano utility that allows easy management of app-specific
environment variables (currently supporting [dotenv](https://github.com/bkeepers/dotenv) only)


## Installation

Add the gem to your Gemfile

    gem 'capistrano3-env', '~> 0.1.0'

Run `bundle` to update your `Gemfile.lock`
Add the following to your `Capfile`:

    require 'capistrano/env'

## Usage

Rake (which is used by Capistrano) has a not so pratical way of specifying task
arguments. To alleviate that issue, a small custom executable was made:

    bundle exec cap-env [stage] [operation] [KEY] [VALUE]

The possible use cases are the following:

    cap-env production get               # shows the current env file for
    production
    cap-env production set APP_ID 123456 # sets KEY=value
    cap-env production get APP_ID        # shows the current value of KEY
    cap-env production delete APP_ID     # deletes the given KEY

Alternatively, you can use the underlying Capistrano tasks directly with `cap
production TASK`, where `TASK` is one of the following:

    env:get            # shows the current env file
    env:get[KEY]       # KEY # shows the current value of KEY from the env file
    env:set[KEY,value] # sets KEY=value in the env file
    env:delete[KEY]    # deletes the given KEY


## Configuration

The following configurations are available to you in config/deploy.rb (default
values are shown here, no need to set them)

    set :config_backend, :dotenv # currently this is the only supported backend
    set :config_file,    '.env'  # you might want to use .env.production instead

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
