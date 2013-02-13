module SettingsJs
  module Backends

    # Public: SettingsLogic backend implementation to get values of Settings from string.
    #
    # klass - Class which is SettingsLogic in the application.
    #
    # Examples
    #
    #   settingsjs_backend = Settings::Backends::SettingsLogic.new(MySettings)
    #
    class SettingsLogic

      attr_accessor :klass

      def initialize(klass)
        self.klass = klass
      end

      # Public: Use application Settingslogic class to get values of a key.
      #
      # base_key - String with path keys seperated by dots.
      #
      # Examples
      #
      #   Settingsjs::Backends::SettingsLogic.new(MySettings).to_hash('key1.subkey1_1')
      #   # => 'Awesome value!'
      #
      # Returns the Hash value.
      def to_hash(base_key)
        keys      = base_key.split(/\./)
        base_hash = klass.send(keys.shift)

        keys.each { |key| base_hash = base_hash.send(key) }

        base_hash
      end

    end
  end
end
