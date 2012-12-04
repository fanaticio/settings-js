require 'active_support/inflector'
require 'json'

module SettingsJs
  class Merger

    def to_hash
      unless config.keys.respond_to?(:reduce)
        raise TypeError.new('the configuration key "keys" must be reduceable')
      end

      config.keys.reduce({}) { |hash, base_key| hash.merge(backend.to_hash(base_key)) }
    end

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
