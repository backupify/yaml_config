# YamlConfig

For loading application/gem configuration from yml files

## Installation

Add this line to your application's Gemfile:

    gem 'yaml_config', :git => 'git@github.com:backupify/yaml_config.git'

And then execute:

    $ bundle

## Usage

lib/my_config.rb:

    class MyConfig
      include YamlConfig

      CONFIGS = [:some_file, :other_file]
    end

config/application.rb (top of file, after bundler setup):

    root = File.expand_path('../..', __FILE__)
    require "#{root}/lib/my_config"
    MyConfig.configure("#{root}/config", *MyConfig::CONFIGS)

