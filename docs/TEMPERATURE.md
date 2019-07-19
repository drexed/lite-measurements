# Temperature

Type | Keys
--- | ---
Imperical | `:fahrenheit`
Metric | `:celsius`, `:kelvin`

Option | Type | Default
--- | --- | ---
from, to | symbol | ---

```ruby
klass = Lite::Measurements::Temperature.new(2)
klass = klass.convert(from: :fahrenheit, to: :celsius)

# - or -

Lite::Measurements::Temperature.convert(2, from: :celsius, to: :kelvin)

# - or -

2.convert_temperature(from: :kelvin, to: :fahrenheit)
```
