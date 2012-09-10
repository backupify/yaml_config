require 'active_support/concern'
require 'yaml_config/utils'

module YamlConfig
  extend ActiveSupport::Concern

  module ClassMethods

    # Initialize/return the global configuration from config/*.yml
    #
    # @scope class
    #
    # @return [ServiceConfig] global config
    def configure(config_dir, *configs)
      configs.each do |yml_conf|
        define_singleton_method(yml_conf) do
          var_name = "@@#{yml_conf}_config".to_sym

          unless class_variable_defined?(var_name)
            file_name = "#{yml_conf.to_s.gsub(/_/, '-')}.yml" #replace underscore with dash in yml filenames
            file = File.expand_path("#{config_dir}/#{file_name}")

            ff = YamlConfig::Utils.from_file(file)
            ff = ff[Rails.env.to_s] if ff[Rails.env.to_s].present?

            class_variable_set var_name, ff
          end

          class_variable_get(var_name)
        end
      end
    end

  end

end

