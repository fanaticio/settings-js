Spec_root = File.expand_path(File.join('..', '..', '..'), __FILE__)

$LOAD_PATH << File.join(Spec_root, '..', 'lib')
require 'settingslogic'
require 'settings_js'
require 'sprockets'

class DummySettings < Settingslogic
  source File.join(Spec_root, 'fixtures', 'settings_js', 'backends', 'settings_logic.yml')
end

def gem_configuration
  SettingsJs.configuration do |config|
    config.backend = 'settings_logic'
    config.keys    = %w(key1 key2.sub_key2_2)
    config.klass   = DummySettings
  end
end

def precompile_app_assets
  puts 'Precompiling assets...'

  generated_files_directory = File.expand_path(File.join('..', '..', 'generated'), __FILE__)

  sprockets = Sprockets::Environment.new(File.join(Spec_root, '..', 'app', 'assets', 'javascripts'))
  sprockets.append_path('settings-js')

  assets           = sprockets.find_asset('settings.js')
  prefix, basename = assets.pathname.to_s.split('/')[-2..-1]

  FileUtils.mkpath(File.join(generated_files_directory))

  assets.write_to(File.join(generated_files_directory, basename))
  assets.to_a.each do |asset|
    realname = asset.pathname.basename.to_s.split('.')[0..1].join('.')
    assets.write_to(File.join(generated_files_directory, basename))
  end
end

gem_configuration
precompile_app_assets
