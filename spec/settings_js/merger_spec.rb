require 'spec_helper'

describe SettingsJs::Merger do

  let(:merger) { SettingsJs::Merger.new }

  describe '#to_hash' do

    context 'when config.keys does not respond to "#reduce"' do

      it 'raises an TypeError' do
        SettingsJs.configuration { |config| config.keys = mock(:not_reduceable_object) }
        expect { merger.to_hash }.to raise_error(TypeError)
      end
    end

    context 'when config.keys respond to "#reduce"' do
      let(:reduceable_object) do
        reduceable_object = mock(:reduceable_object)
        reduceable_object.stub(:reduce)
        reduceable_object
      end

      it 'does not raise a TypeError' do
        SettingsJs.configuration { |config| config.keys = reduceable_object }
        expect { merger.to_hash }.to_not raise_error(TypeError)
      end
    end

    it 'returns a hash which merge all keys hash response' do
      adapter = mock(:adapter)
      adapter.stub(:to_hash).and_return({ key1: 'value1', key2: 'value2' }, { key2: { key2_1: 'value2_1', key2_2: 'value2_2' }})

      config = mock(:config)
      config.stub(:keys).and_return(%w(key1 key2))

      merger.stub(:config).and_return(config)
      merger.stub(:adapter).and_return(adapter)

      expected_hash = {
        key1: 'value1',
        key2: {
          key2_1: 'value2_1',
          key2_2: 'value2_2',
        }
      }

      merger.to_hash.should == expected_hash
    end
  end

  describe '#to_json' do
    it 'calls #to_json method on the #to_hash result' do
      hash_mocked = mock(:hash)
      hash_mocked.stub(:to_json)
      merger.stub(:to_hash).and_return(hash_mocked)

      hash_mocked.should_receive(:to_json).once

      merger.to_json
    end
  end

end
