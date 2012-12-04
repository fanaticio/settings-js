require 'spec_helper'

describe 'SettingsJs::Config' do
  let(:config) { SettingsJs::Config.instance }

  it { config.should have_attr_accessor :backend }
  it { config.should have_attr_accessor :keys }
  it { config.should have_attr_accessor :klass }
end
