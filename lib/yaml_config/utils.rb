require 'hashie'

module YamlConfig
  class Utils

    # Initialize/return the global configuration the given yaml file
    #
    # @param [String] filename
    #
    # @scope class
    #
    # @return [ServiceConfig] config
    def from_file(filename)
      config_hash = transform_config_hash(YAML.load_file(filename))
      Hashie::Mash.new(config_hash)
    end

    private

    # Symbolizes keys and expands values of the private config hash
    def self.transform_config_hash(hash)
      hash.each_key do |key|
        hash[key] = expand(hash[key])
      end
    end

    # Recursively expand String values with ruby-style "#{[ruby expression]}"
    #
    # @scope class
    #
    # @param [Object] value
    #
    # @return [Object] expanded value
    def self.expand(value)
      val = case value
              when Hash
                value.each_key do |key|
                  value[key] = expand(value[key])
                end
              when String
                expand_string(value)
              when Enumerable
                value.collect { |v| expand(v) }
              else
                value
            end
      return val
    end

    # Given a string, expand ruby-style "#{[ruby expression]}" as well as booleans
    #
    # @param [String] val
    # @scope class
    #
    # @return [String] expanded value
    def self.expand_string(val)
      while val =~ /\#\{[^\}]+\}/
        val = eval('%Q{' + val + '}', binding, __FILE__)
      end
      val = true if val == "true"
      val = false if val == "false"
      return val
    end
  end
end