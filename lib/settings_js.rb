require 'settings_js/config'
require 'settings_js/merger'

module SettingsJs

  def self.configuration(&block)
    block.call(SettingsJs::Config.instance)
  end

end

