Spec_root = File.expand_path('..', __FILE__)

require File.join(Spec_root, '..', 'lib', 'settings_js')

Dir[File.join(Spec_root, 'support', '**', '*.rb')].each { |support_helper| require support_helper }
