module SettingsJs
  module Backends
    class SettingsLogic

      attr_accessor :klass

      def initialize(klass)
        self.klass = klass
      end

      def to_hash(base_key)
        keys      = base_key.split(/\./)
        base_hash = klass.send(keys.shift)

        keys.each { |key| base_hash = base_hash.send(key) }

        base_hash
      end

    end
  end
end
