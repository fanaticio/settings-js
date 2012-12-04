require 'singleton'

module SettingsJs
  class Config
    include ::Singleton

    attr_accessor :backend,
                  :keys,
                  :klass

  end
end
