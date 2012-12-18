# Welcome to Settings-js

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/fanaticio/settings-js)
[![Travis CI](https://secure.travis-ci.org/fanaticio/settings-js.png)](http://travis-ci.org/fanaticio/settings-js)
[![Dependency Status](https://gemnasium.com/fanaticio/settings-js.png)](https://gemnasium.com/fanaticio/settings-js)

Use application specific settings with Javascript.

As modern web applications rely more and more on javascript and frameworks like backbone/angular, it can be quite a hussle to maintain duplicate values in javascript and ruby.

`Settings-js` is designed to work with different settings backends. As of today, only [Settingslogic](https://github.com/binarylogic/settingslogic) is supported.

## Getting started

Add this to your Gemfile

```ruby
gem 'settings_js'
```

Add the following to an initializer:

* Settings Backend (for the moment, only [settingslogic](https://github.com/binarylogic/settingslogic) is implemented)
* Settings Class used by the application
* List the keys that must be accessible in the javascript

```ruby
SettingsJs.configuration do |config|
  config.backend = 'settings_logic'      # backend used
  config.klass   = Settings              # your own settings class
  config.keys    = %w(hosts custom.keys) # imported keys
end
```

Load the Javascript file and access the `Settings` class:

```javascript
// = require settings-js/settings

Settings.host_name
# => 'http://localhost:8080'
```

## Contributing

Once you've made your great commits:

1. Fork settings_js
2. Create a topic branch - git checkout -b my_branch
3. Push to your branch - git push origin my_branch
4. Create a Pull Request from your branch
5. That's it!

## License

`Settings-js` is released under the [MIT License](http://www.opensource.org/licenses/MIT).
