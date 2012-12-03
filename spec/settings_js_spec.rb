require 'spec_helper'

describe SettingsJs do

  describe '.configuration' do
    it 'calls block with configuration object in parameter' do
      expect { |config| SettingsJs.configuration(&config) }.to yield_with_args(SettingsJs::Config.instance)
    end
  end

end
