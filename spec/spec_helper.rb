Spec_root = File.expand_path('..', __FILE__)

require File.join(Spec_root, '..', 'lib', 'settings_js')

def reload_gem
  load File.join(Spec_root, '..', 'lib', 'settings_js.rb')
end

Dir[File.join(Spec_root, 'support', '**', '*.rb')].each { |support_helper| require support_helper }

