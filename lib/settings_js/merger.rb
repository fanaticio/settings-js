require 'active_support/inflector'
require 'json'

module SettingsJs

  class Merger

    # Public: Get all values for keys defined in settings and merged it to a hash.
    #
    # Examples
    #
    #   merger = SettingsJs::Merger.new
    #   merger.to_hash
    #   # => { key1: 'value', key2: { sub_key2: 'other value' }}
    #
    # Returns Hash.
    # Raises TypeError if keys defined in config is not a reduceable object (Array,...)
    def to_hash
      unless config.keys.respond_to?(:reduce)
        raise TypeError.new('the configuration key "keys" must be reduceable')
      end

      config.keys.reduce({}) { |hash, base_key| hash.merge(backend.to_hash(base_key)) }
    end

    # Public: Get all values for keys defined in settings and merged it to a json.
    #
    # Examples
    #
    #   merger = SettingsJs::Merger.new
    #   merger.to_hash
    #   # => { key1: 'value', key2: { sub_key2: 'other value' }}
    #   merger.to_json
    #   # => { 'key1': 'value', 'key2': { 'sub_key2': 'other value' }}
    #
    # Returns Json.
    def to_json
      to_hash.to_json
    end

  private

    def config
      SettingsJs::Config.instance
    end

    def backend
      backend_proxy_path = "settings_js/backends/#{config.backend}"

      require backend_proxy_path
      backend_proxy_path.classify.constantize.new(config.klass)
    end
  end
end
