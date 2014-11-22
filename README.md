# YamlConfig

[![Build Status](https://magnum.travis-ci.com/backupify/yaml_config.svg?token=QfvTFsMunFJgkBxHwi42&branch=master)](https://magnum.travis-ci.com/backupify/yaml_config)
[![Coverage Status](https://coveralls.io/repos/backupify/yaml_config/badge.png?branch=master)](https://coveralls.io/r/backupify/yaml_config?branch=master)

For loading application/gem configuration from yml files

## Installation

Add this line to your application's Gemfile:

```rb
gem 'yaml_config', :git => 'git@github.com:backupify/yaml_config.git'
```

And then execute:

```sh
$ bundle
```

## Usage

```rb
# lib/my_config.rb:
class MyConfig
  include YamlConfig

  CONFIGS = [:some_file, :other_file]
end

# config/application.rb (top of file, after bundler setup):
root = File.expand_path('../..', __FILE__)
require "#{root}/lib/my_config"
MyConfig.configure("#{root}/config", *MyConfig::CONFIGS)
```
