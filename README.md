# Capistrano 3 Configuration Management

## Usage

Add the gem to your Gemfile

    gem 'capistrano-doenv', '~> 0.1.0'

Run `bundle` to update your `Gemfile.lock`
Add the following to your `Capfile`:

    require 'capistrano/dotenv'

The following tasks will be available to you:

    dotenv:  # shows the current .env file
    dotenv:get KEY # shows the current value of KEY from .env
    dotenv:set KEY value
    dotenv:delete KEY

# TODO

* Everything

# Contributing

This is a very early work, extracted from a specific project i'm working on.
If you require a new feature, please open an issue, or preferably, a pull request with
a proposed implementation
