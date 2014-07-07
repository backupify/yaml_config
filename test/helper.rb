require 'rubygems'

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end

require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'minitest/autorun'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'yaml_config'

class Minitest::Spec
  # make minitest spec dsl similar to shoulda
  class << self
    alias :setup :before
    alias :teardown :after
    alias :context :describe
    alias :should :it
  end

  def fixtures_root
    @fixtures_root ||= File.expand_path(File.dirname(__FILE__) + "/fixtures")
  end

end
