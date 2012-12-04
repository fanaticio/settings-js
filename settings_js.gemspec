Gem::Specification.new do |s|
  s.name        = 'settings_js'
  s.version     = '0.1.0'
  s.date        = '2012-11-30'
  s.summary     = 'Sharing same application settings between ruby and javascript'
  s.authors     = ['Kevin Disneur']
  s.email       = 'kevin.disneur@gmail.com'
  s.files       = `git ls-files`.split(/\n/)
  s.test_files  = `git ls-files -- spec/*`.split(/\n/)
  s.homepage    = 'http://rubygems.org/gems/settings_js'

  s.add_dependency 'active_support', '> 1.0'
  s.add_dependency 'json',           '> 0'
  s.add_dependency 'sprockets'

  s.add_development_dependency 'jasmine'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'settingslogic'
  s.add_development_dependency 'shoulda'
end
