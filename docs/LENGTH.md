# Length

Type | Keys
--- | ---
Imperical | `:inches`, `:feet`, `:yards`, `:miles`, `:nautical_miles`
Metric | `:micrometers`, `:millimeters`, `:centimeters`, `:decimeters`, `:meters`, `:dekameters`, `:hectometers`, `:kilometers`

Option | Type | Default
--- | --- | ---
from, to | symbol | ---

```ruby
klass = Lite::Measurements::Length.new(2)
klass = klass.convert(from: :inches, to: :yards)

# - or -

Lite::Measurements::Length.convert(2, from: :meters, to: :feet)

# - or -

2.convert_length(from: :miles, to: :millimeters)
```
