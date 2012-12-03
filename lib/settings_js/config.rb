require 'singleton'

module SettingsJs
  class Config
    include ::Singleton

    attr_accessor :adapter,
                  :keys,
                  :klass

  end
end
