require 'spec_helper'

describe SettingsJs::Merger do

  let(:merger) { SettingsJs::Merger.new }

  describe '#to_hash' do
    context 'when config.keys does not respond to "#reduce"' do
      it 'raises an TypeError' do
        SettingsJs.configuration { |config| config.keys = double(:not_reduceable_object) }
        expect { merger.to_hash }.to raise_error(TypeError)
      end
    end

    context 'when config.keys respond to "#reduce"' do
      let(:reduceable_object) do
        reduceable_object = double(:reduceable_object)
        reduceable_object.stub(:reduce)
        reduceable_object
      end

      it 'does not raise a TypeError' do
        SettingsJs.configuration { |config| config.keys = reduceable_object }
        expect { merger.to_hash }.to_not raise_error
      end
    end

    it 'returns a hash which merge all keys hash response' do
      backend = double(:backend)
      backend.stub(:to_hash).with('key1').and_return({ key1: 'value1' })
      backend.stub(:to_hash).with('key2').and_return({ key2: { key2_1: 'value2_1', key2_2: 'value2_2' }})

      config = double(:config)
      config.stub(:keys).and_return(%w(key1 key2))

      merger.stub(:config).and_return(config)
      merger.stub(:backend).and_return(backend)

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
      hash_doubleed = double(:hash)
      hash_doubleed.stub(:to_json)
      merger.stub(:to_hash).and_return(hash_doubleed)

      hash_doubleed.should_receive(:to_json).once

      merger.to_json
    end
  end

end
