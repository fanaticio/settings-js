require 'spec_helper'
require 'settingslogic'
require 'settings_js/backends/settings_logic'

describe 'SettingsJs::Backends::SettingsLogic' do

  let(:settings_klass) do
    Class.new(Settingslogic) do
      source File.join(Spec_root, 'fixtures', 'settings_js', 'backends', 'settings_logic.yml')
    end
  end

  let(:backend_instance) { SettingsJs::Backends::SettingsLogic.new(settings_klass) }

  it { backend_instance.should have_attr_accessor(:klass) }

  describe '#to_hash' do
    it 'returns subkeys when base key is in settings root' do
      backend_instance.to_hash('key1').should == { 'sub_key1' => 'sub_value1' }
    end

    it 'returns subkeys when base key is under the settings root' do
      expected_hash = {
        'sub_key2_2_1' => 'sub_value2_2_1' ,
        'sub_key2_2_2' => {
          'sub_key2_2_2_1' => 'sub_value2_2_2_1'
        }
      }

      backend_instance.to_hash('key2.sub_key2_2').should == expected_hash
    end
  end
end
