require 'spec_helper'

describe SettingsJs do

  describe '.configuration' do
    it 'calls block with configuration object in parameter' do
      expect { |config| SettingsJs.configuration(&config) }.to yield_with_args(SettingsJs::Config.instance)
    end
  end

  describe 'Engine' do
    context 'when Rails constant does not exist' do
      it 'does not make the gem an engine' do
        reload_gem
        defined?(::SettingsJS::Engine).should be_false
      end
    end

    context 'when Rails constant exists' do
      before(:each) { stub_const('Rails', Class.new) }

      it 'does not make the gem an engine' do
        reload_gem
        defined?(::SettingsJS::Engine).should be_false
      end

      context 'when Rails::Engine constant exists' do
        before(:each) { stub_const('Rails::Engine', Class.new) }

        it 'makes the gem an engine' do
          reload_gem
          defined?(::SettingsJS::Engine).should be_true
        end
      end

    end
  end

end
