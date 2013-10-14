# 0.3.0 (no backward)

* Use base key as settings key

```ruby
SettingsJs.configuration do |config|
  config.keys    = %w(adapters.maps)
end

# old Settings JS:
console.log(Settings);
# => { defaults: { latitude: 42.00, longitude: 41.00 }}

# current Settings JS:
console.log(Settings);
# => { maps: { defaults: { latitude: 42.00, longitude: 41.00 }}}
```

# 0.2.0

* Make it a Rails engine

# 0.1.2

* Fix dependency error `active_support` -> `activesupport`

# 0.1.1

* Renaming adapters to backends

# 0.1.0

* Basic implementation with SettingsLogic backend
