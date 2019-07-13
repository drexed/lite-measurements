# Temperature

Option | Type | Default
--- | --- | ---
from, to | symbol | `:celsius`, `:fahrenheit`, `:kelvin`

```ruby
temperature = Lite::Measurements::Temperature.new(2)
temperature = temperature.convert(from: :fahrenheit, to: :celsius)      #=> -16.666666666666668

# - or -

Lite::Measurements::Temperature.convert(2, from: :celsius, to: :kelvin) #=> 275.15

# - or -

2.convert_temperature(from: :kelvin, to: :fahrenheit)                   #=> -456.07
```
