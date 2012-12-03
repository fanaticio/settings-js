require 'active_support/inflector'
require 'json'

module SettingsJs
  class Merger

    def to_hash
      unless config.keys.respond_to?(:reduce)
        raise TypeError.new('the configuration key "keys" must be reduceable')
      end

      config.keys.reduce({}) { |hash, base_key| hash.merge(adapter.to_hash(base_key)) }
    end

    def to_json
      to_hash.to_json
    end

  private

    def config
      SettingsJs::Config.instance
    end

    def adapter
      adapter_proxy_path = "settings_js/adapters/#{config.adapter}"

      require adapter_proxy_path
      adapter_proxy_path.classify.constantize.new(config.klass)
    end
  end
end
