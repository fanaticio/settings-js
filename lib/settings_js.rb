require 'settings_js/config'
require 'settings_js/merger'

module SettingsJs

  if defined?(::Rails) && defined?(::Rails::Engine)
    require 'settings_js/engine'
  end

  # Public: Configuration initializer.
  #
  # block - block with configuration object in parameter.
  #
  # Examples
  #
  #   SettingsJs.condiguration do |config|
  #     config.backend = 'awesome_backend'
  #     config.klass   = ApplicationSettings
  #     config.keys    = %w(key.key2 key3)
  #   end
  #
  # Returns Nothing.
  def self.configuration(&block)
    block.call(SettingsJs::Config.instance)
  end

end

